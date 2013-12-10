from wings.wings_main.models import Participant
import factory


class ParticipantFactory(factory.DjangoModelFactory):
    FACTORY_FOR = Participant
    id_string = factory.Sequence(lambda n: n)
