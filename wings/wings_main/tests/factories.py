from wings.wings_main.models import Participant
import factory


class ParticipantFactory(factory.DjangoModelFactory):
    class Meta:
        model = Participant
    id_string = factory.Sequence(lambda n: n)
