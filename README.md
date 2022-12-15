# Teacher's Bingo

Techer's Bingo is a webapp and Flutter package that generates Bingos for boring 
teaching lessons. You can select the teachers you have lessons with and check 
fields everytime they say a commonly said quote.

## File structure

* Inside the `webapp` folder you will find the webapp and the corresponsing API 
  programmed in NextJS
* Inside the `flutter-client` folder you will find the Flutter client which 
  intersects with the webapp's API

## Overall structure

The stack consists of a web front- and backend coded with NextJS. Currently 
there is a Notion Database with a corresponding Notion Integration in use for 
storing all those quotes. In the Flutter app you can do the same things as you 
would inside of the webapp just locally with the option of storing the Bingos 
locally and checking them inside the app rather than writing on a pdf.
