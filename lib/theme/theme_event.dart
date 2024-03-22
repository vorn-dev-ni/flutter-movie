part of 'theme_bloc.dart';


abstract class ThemeEvent {

}
class SwitchThemeEvent  extends ThemeEvent{
  var mode;

  SwitchThemeEvent(this.mode);
}
class GetTheme extends ThemeEvent {

}