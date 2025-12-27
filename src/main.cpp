#include <QApplication>
#include <QMainWindow>
#include <QWebEngineView>

int main(int argc, char *argv[]) {
  QApplication app(argc, argv);
  QWebEngineView web;
  web.load(QUrl("https://fsf.org"));

  web.show();
  return app.exec();
}
