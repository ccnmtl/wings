import factory
from django.contrib.auth.models import User
from wings.analytics.models import ActionType, ActionTaken


class ActionTypeFactory(factory.DjangoModelFactory):
    class Meta:
        model = ActionType
    label = "action type"


class UserFactory(factory.DjangoModelFactory):
    class Meta:
        model = User
    username = factory.Sequence(lambda n: "user%03d" % n)
    is_staff = True


class ActionTakenFactory(factory.DjangoModelFactory):
    class Meta:
        model = ActionTaken
    user = factory.SubFactory(User)
    action = factory.SubFactory(ActionType)
