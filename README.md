# LiveBindings - Beyond the standard
The more I learn about and use LiveBindings in Delphi, the more I like them! Sometimes I need to use custom formatting and it's nice that there are several methods available but I often find myself wishing there were more. Then I learned how simple it was to write your own, so I decided to do that and share them with anyone else who finds them useful.

This list of custom methods will grow over time as I find one I need or get suggestions. 

Here's what's included so far:

**DateTime Utilities**
* `Now()` - simply returns the current date/time
* `YearsSince(DateTime, RoundToDigits)` - returns the number of years since the DateTime given, rounded
* `MonthsSince(DateTime, RoundToDigits)` - returns the number of months since the DateTime given, rounded
* `DaysSince(DateTime, RoundToDigits)` - returns the number of days since the DateTime given, rounded
* `HoursSince(DateTime, RoundToDigits)` - returns the number of hours since the DateTime given, rounded
* `MinutesSince(DateTime, RoundToDigits)` - returns the number of minutes since the DateTime given, rounded
* `SecondsSince(DateTime, RoundToDigits)` - returns the number of seconds since the DateTime given, rounded

**String Utilities**
* `StrLen(string)` - returns the length of the given string
* `DoubleAmp(string)` - returns the given string with each ampersand doubled; useful if the string contains an ampersand and it's underlinging the string instead of showing it

**JSON Utilities**
* `JsonValue(JsonString, String)` - parses the JSON string and returns the value associated with the named second parmaeter; example: `JsonValue('{"Id":1,"Name":"John"}', 'Name')` would return "John"; returns blank if the JsonString parameter is not valid or if the second parameter is not a named field of the JSON string.
* `JsonArrayValToCSV(JsonArray, String)` - parses the JSON string as an array, uses the second parameter to extract the value from each array element identified by that field name; example: `'[{"Id":1,"Name":"John"},{"Id":2,"Name":"Sue"}]', 'Name')` would return "'John, Sue'"; returns blank if the JsonArray parameter is not a valid JSON array or if the second parameter is not a named field of the JSON array elements.

_More coming!_

Reference: [Creating Custom LiveBindings Methods](http://docwiki.embarcadero.com/RADStudio/Sydney/en/Creating_Custom_LiveBindings_Methods)

David Cornelius

[Contact](https://corneliusconcepts.com/contact_us) * [Blog](https://corneliusconcepts.tech)
