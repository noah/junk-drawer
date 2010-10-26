import pynotify

class Notify(object):

    def __init__(self,namespace,title,body,icon=''):
        
        pynotify.init(namespace)
        self.notifier = pynotify.Notification(
            title,body,icon)
        self.notifier.set_urgency(pynotify.URGENCY_NORMAL)
        self.notifier.set_timeout(pynotify.EXPIRES_NEVER)

    def show(self):
        self.notifier.show()

if __name__ == '__main__':
    n = Notify(
        namespace="test",
        title="Hello world!",
        body="Someting something."
    ).show()
