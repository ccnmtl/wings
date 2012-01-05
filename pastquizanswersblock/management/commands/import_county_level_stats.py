from django.core.management.base import BaseCommand, CommandError
#from data.models import Site,Location,Series,Row
from careermapblock.models import *
import csv, pdb, re

def slugify(val):
    _slugify_strip_re = re.compile(r'[^\w\s-]')
    _slugify_hyphenate_re = re.compile(r'[-\s]+')
    val = unicode(_slugify_strip_re.sub('', val).strip().lower())
    return _slugify_hyphenate_re.sub('_', val)

def get_or_create_stat (county, column, val_str):
    stat_value = None
    try:
        stat_value = CountyStatValue.objects.get(county__name=county, stat_type__name = column)
    except CountyStatValue.DoesNotExist:
        stat_value = CountyStatValue()
        stat_value.cmap_id = county.cmap_id
        stat_value.county = county
        stat_value.stat_type = column
    print "Setting value of stat %s to %s for county %s" % (column, val_str, county)
    
    if '%' in val_str:
        val = float(val_str.replace('%', ''))/100
    else:
        val = float(val_str)
    
    stat_value.value = val
    stat_value.save()
        
        
class Command(BaseCommand):
    args = ''
    help = """Assumes
    1) this is being run from the root level of the Django site.
    2) the presence of a county_stats directory, with files in it whose name (e.g. under_5.csv) is the slug for a corresponding CountyStatType object.
    3) the format of each file to be:
        Moretooth County, 4
        Northwest County, 123
        Nerve County, 13
        South County, 155
    4) the existence of counties that correspond (case insensitive) to the county names in the file. 
    """
    def handle(self, *args, **options):
        path_to_files = 'county_stats'
        county_stat_columns =  os.listdir (path_to_files)
        errors = ""
        #TODO: make c.name tolower so lookup will be case-insensitive
        counties = dict([(c.name.lower(), c) for c in County.objects.all()])
        stat_types = dict([(slugify(c.name), c) for c in CountyStatType.objects.all()])
        for filename in county_stat_columns:
            stat_slug = filename.replace ('.csv', '')
            reader = csv.reader(open("%s/%s" % (path_to_files, filename)))
            if stat_slug in stat_types.keys():
                column_obj =  stat_types[stat_slug]
                var = raw_input("Replace values for column \"%s\" with the values in file \"%s\" ? (y/n)\n" % ( column_obj.name,  filename))
                if var == 'y':
                    for row in reader:
                        if row[0].lower() in counties.keys():
                            county_obj = counties[row[0].lower()]
                            get_or_create_stat (county_obj, column_obj, row[1])
                        else:
                            print "%s not found in list of counties " % row[0]
                else:
                    print "OK; skipping file %s" % filename
            else:
                print "Could not use this file: %s not found in list of columns" % stat_slug

