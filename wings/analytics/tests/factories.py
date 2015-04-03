import factory
from django.contrib.auth.models import User
from wings.analytics.models import ActionType, ActionTaken


class ActionTypeFactory(factory.DjangoModelFactory):
    FACTORY_FOR = ActionType
    label = "action type"


class UserFactory(factory.DjangoModelFactory):
    FACTORY_FOR = User
    username = factory.Sequence(lambda n: "user%03d" % n)
    is_staff = True


class ActionTakenFactory(factory.DjangoModelFactory):
    FACTORY_FOR = ActionTaken
    user = factory.SubFactory(User)
    action = factory.SubFactory(ActionType)
