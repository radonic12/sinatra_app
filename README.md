

- Generelt
    o Det er blevet lagt meget lidt vægt på udseende.
    Dette kun have været pænere i form af valg af farve og skriftype.
    Samtidigt kunne man have lave JS som viste knapperne dynamisk alt
    efter behov.


- Authentication protokol/metode:
    o HTTP authentication
        o http://sinatrarb.com/faq.html#auth
    o Lave session som skal aktiveret. Kan aktiveres ved login.


- Hvordan kan man lave servicen redundant? 
    o Inserte i 3 forskellige tables når man opretter virksomhed
    o Loop fetch fra 1. table, hvis det fejler gå videre til 2. table etc.
    o Catche søge resultater eller hele databasen(alt efter størrelse)
    så de ikke skal hentes ved hvert request.
    o Wrap code i try catch blog og sende errors til DB table og
    og se om bestemt code fejler systematisk


- Hvordan kan man implementere versionering af virksomhedsdata?
    o Lave en ekstra database som hedder versions.
    Når et entry bliver opdateret bliver de gamle værdier gemt i databasen 		  
    "versions" sammen med ID’et af den oprindelige entry.
    Når man så skal hente versions af en bestemt entry tager man dens ID
    og henter version som har det ID som der oprindelige ID.
    Dermed ville "Verions" databasen have følgende kollonner:
    (ID,Orig_ID,name,adress,city,country,tlf)


- Hvordan vil du designe og implementere en søgefunktion
    o Kopiere min opret ny virksomhed form ændre navnet på knappen til "Søg efter 	  
    virksomehed" men ellers bruge den som base evnt. tilføje ID som parameter. 
    Derefter lave en ny backend function som kunne ligne den følgende og 
    indsætte den som action for formen:

post '/search'  do
    review = Review.all()
    if params[:name] != ""
        review = review.all(:name.like => "%#{params[:name]}%")
    end
    if params[:adress] != ""
        review = review.all(:adress.like => "%#{params[:adress]}%")
    end
    if params[:city] != ""
        review = review.all(:city.like => "%#{params[:city]}%")
    end
    
    if params[:country] != ""
        review = review.all(:country.like => "%#{params[:country]}%")
    end

    if params[:tlf] != ""
        review = review.all(:tlf.like => "%#{params[:tlf]}%")
    end
    review.to_json
end
