module Places exposing (..)


all =
    [ {-
           { city = "Holtsville", stateAbbrev = "NY", state = "New York" }
         , { city = "Adjuntas", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Aguada", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Aguadilla", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Maricao", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Anasco", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Angeles", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Arecibo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Bajadero", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Barceloneta", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Boqueron", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Cabo Rojo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Penuelas", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Camuy", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Castaner", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Rosario", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Sabana Grande", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Ciales", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Utuado", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Dorado", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Ensenada", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Florida", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Garrochales", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Guanica", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Guayanilla", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Hatillo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Hormigueros", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Isabela", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Jayuya", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Lajas", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Lares", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Las Marias", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Manati", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Moca", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Rincon", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Quebradillas", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Mayaguez", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "San German", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "San Sebastian", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Morovis", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Sabana Hoyos", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "San Antonio", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Vega Alta", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Vega Baja", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Yauco", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Aguas Buenas", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Aguirre", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Aibonito", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Maunabo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Arroyo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Mercedita", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Ponce", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Naguabo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Naranjito", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Orocovis", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Palmer", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Patillas", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Caguas", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Ponce", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Canovanas", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Ponce", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Ceiba", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Cayey", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Fajardo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Cidra", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Puerto Real", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Punta Santiago", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Roosevelt Roads", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Rio Blanco", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Rio Grande", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Salinas", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "San Lorenzo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Santa Isabel", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Vieques", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Villalba", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Yabucoa", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Coamo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Las Piedras", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Loiza", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Luquillo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Culebra", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Juncos", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Gurabo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Coto Laurel", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Comerio", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Corozal", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Guayama", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "La Plata", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Humacao", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Barranquitas", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Juana Diaz", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "St Thomas", stateAbbrev = "VI", state = "Virgin Islands" }
         , { city = "Christiansted", stateAbbrev = "VI", state = "Virgin Islands" }
         , { city = "St John", stateAbbrev = "VI", state = "Virgin Islands" }
         , { city = "Frederiksted", stateAbbrev = "VI", state = "Virgin Islands" }
         , { city = "Kingshill", stateAbbrev = "VI", state = "Virgin Islands" }
         , { city = "San Juan", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Fort Buchanan", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "San Juan", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "GPO", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "San Juan", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Toa Baja", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Sabana Seca", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Toa Alta", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Bayamon", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Catano", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Guaynabo", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "San Juan", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Trujillo Alto", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Saint Just", stateAbbrev = "PR", state = "Puerto Rico" }
         , { city = "Carolina", stateAbbrev = "PR", state = "Puerto Rico" }
      -}
      { city = "Agawam", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Amherst", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Barre", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Belchertown", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Blandford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Bondsville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Brimfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Chester", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Chesterfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Chicopee", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Cummington", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Easthampton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Longmeadow", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Otis", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Feeding Hills", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Gilbertville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Goshen", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Granby", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Granville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hadley", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hampden", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hardwick", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hatfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Haydenville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Holyoke", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Huntington", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Leeds", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Leverett", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Ludlow", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Monson", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Amherst", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Northampton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Florence", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Northampton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Hatfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Oakham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Palmer", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Plainfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Russell", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Shutesbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Southampton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Barre", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Hadley", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Southwick", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Thorndike", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Three Rivers", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wales", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Ware", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Warren", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Chesterfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Westfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Hatfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Springfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Warren", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Whately", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wheelwright", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wilbraham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Williamsburg", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Woronoco", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Worthington", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Springfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Longmeadow", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Springfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Longmeadow", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Indian Orchard", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Springfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Pittsfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Adams", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Ashley Falls", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Becket", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Berkshire", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Cheshire", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dalton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Glendale", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Great Barrington", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hinsdale", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Housatonic", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lanesboro", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lee", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lenox", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lenox Dale", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Middlefield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Mill River", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Monterey", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Adams", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Egremont", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Otis", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Richmond", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sandisfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Savoy", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sheffield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Egremont", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Southfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Lee", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Stockbridge", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Tyringham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Stockbridge", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Williamstown", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Windsor", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Greenfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Ashfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Athol", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Bernardston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Buckland", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Charlemont", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Colrain", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Conway", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Deerfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Drury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Erving", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Heath", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lake Pleasant", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Millers Falls", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Monroe Bridge", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Montague", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Gill", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "New Salem", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Northfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Orange", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Petersham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Rowe", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Royalston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Shelburne Falls", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Deerfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sunderland", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Turners Falls", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Warwick", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wendell", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wendell Depot", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Fitchburg", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Ashburnham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Ashby", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Ayer", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Devens", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Baldwinville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Templeton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Gardner", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Westminster", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Groton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Harvard", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hubbardston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Leominster", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Littleton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lunenburg", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Pepperell", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Shirley", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Still River", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Templeton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Townsend", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Groton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Groton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Townsend", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Winchendon", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Winchendon Springs", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Auburn", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Berlin", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Blackstone", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Boylston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Brookfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Charlton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Charlton City", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Charlton Depot", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Clinton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Brookfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Douglas", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Princeton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Fiskdale", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Grafton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Holden", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Holland", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Jefferson", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lancaster", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Leicester", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Linwood", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Manchaug", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Millbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Millville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "New Braintree", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Northborough", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Northbridge", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Brookfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Grafton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Oxford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Uxbridge", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Oxford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Princeton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Rochdale", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Rutland", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Shrewsbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Southbridge", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Grafton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Lancaster", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Spencer", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sterling", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sturbridge", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Upton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Uxbridge", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Webster", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dudley", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Westborough", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "EMC", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Westborough", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Boylston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Brookfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Millbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Whitinsville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sutton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Worcester", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Cherry Valley", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Paxton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Worcester", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Framingham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Village Of Nagog Woods", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Boxborough", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Acton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Ashland", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Bedford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hanscom AFB", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Bolton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Carlisle", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Concord", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Fayville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Holliston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hopedale", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hopkinton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hudson", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Marlborough", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Maynard", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Mendon", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Milford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Natick", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sherborn", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Southborough", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lincoln", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Stow", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sudbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wayland", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Woodville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Woburn", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Burlington", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Woburn", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Andover", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Woburn", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Billerica", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Chelmsford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dracut", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dunstable", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Haverhill", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Georgetown", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Groveland", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Haverhill", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lawrence", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Methuen", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Andover", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lowell", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Merrimac", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Billerica", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Chelmsford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Reading", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Nutting Lake", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Pinehurst", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Reading", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Tewksbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Tyngsboro", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wakefield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Boxford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Westford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wilmington", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Reading", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Winchester", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Andover", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lynn", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Saugus", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Swampscott", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Nahant", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lynn", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Amesbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Beverly", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Boxford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Byfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Danvers", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Essex", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Gloucester", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hamilton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hathorne", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Ipswich", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lynnfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Manchester", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Marblehead", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Middleton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Newburyport", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Newbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Salisbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Peabody", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Prides Crossing", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Rockport", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Rowley", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Salem", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Hamilton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Topsfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wenham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Newbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Accord", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Bellingham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Brant Rock", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Canton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Cohasset", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dedham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dover", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Walpole", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Foxboro", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Franklin", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Greenbush", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Green Harbor", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hingham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hull", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Humarock", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Mansfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Marshfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Marshfield Hills", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Medfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Medway", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Millis", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Minot", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Norfolk", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Marshfield", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Scituate", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Norwell", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Norwood", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Ocean Bluff", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Scituate", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sharon", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sheldonville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Walpole", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Stoughton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Walpole", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Westwood", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wrentham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Boston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Roxbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Roxbury Crossing", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dorchester", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dorchester Center", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dorchester", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Mattapan", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Boston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Boston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Boston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Charlestown", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Jamaica Plain", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Roslindale", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Roxbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Allston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Brighton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hyde Park", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Readville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Cambridge", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Somerville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Malden", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Everett", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Chelsea", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Revere", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Winthrop", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Medford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Medford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Boston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Quincy", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Melrose", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Stoneham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Braintree", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Milton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Milton Village", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Weymouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Weymouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Weymouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Weymouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Boston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Boston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Cambridge", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Boston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Brockton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Avon", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Bridgewater", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Bryantville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Carver", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Duxbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Bridgewater", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Easton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Elmwood", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Halifax", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hanover", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hanson", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Holbrook", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Middleboro", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Manomet", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lakeville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Middleboro", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Monponsett", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Abington", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Carver", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Easton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Pembroke", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Pembroke", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Plymouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Kingston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Carver", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Plympton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Randolph", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Rockland", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Easton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Bridgewater", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "White Horse Beach", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Whitman", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Lexington", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Brookline", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Brookline Village", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Waltham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Waltham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "New Town", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Babson Park", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Newton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Newton Center", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Newtonville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Newton Highlands", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Newton Lower Falls", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Newton Upper Falls", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Newton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Auburndale", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Chestnut Hill", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Waban", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Watertown", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Arlington", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Arlington Heights", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Watertown", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Belmont", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Waverley", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wellesley Hills", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wellesley", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Needham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Weston", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Needham Heights", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Nonantum", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Buzzards Bay", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Cataumet", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Chilmark", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Falmouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Sandwich", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Wareham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Edgartown", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Falmouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Buzzards Bay", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Woods Hole", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Menemsha", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Monument Beach", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Nantucket", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Falmouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Oak Bluffs", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Onset", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Pocasset", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sagamore", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sagamore Beach", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Sandwich", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Siasconset", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Silver Beach", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Vineyard Haven", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wareham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Chop", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Falmouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Tisbury", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Wareham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hyannis", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Barnstable", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Brewster", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Centerville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Chatham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Cotuit", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Cummaquid", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dennis", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dennis Port", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Dennis", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Eastham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Orleans", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Forestdale", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Harwich", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Harwich Port", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Hyannis Port", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Marstons Mills", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Mashpee", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Chatham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Eastham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Truro", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Orleans", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Osterville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Provincetown", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Chatham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Dennis", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Harwich", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Orleans", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Wellfleet", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Yarmouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Truro", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Wellfleet", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Barnstable", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Chatham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Dennis", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Harwich", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Hyannisport", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "West Yarmouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Yarmouth Port", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Assonet", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Attleboro", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Chartley", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Cuttyhunk", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dartmouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Dighton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Freetown", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "East Taunton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Fairhaven", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Fall River", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Somerset", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Marion", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Mattapoisett", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "New Bedford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Acushnet", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "New Bedford", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Dartmouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "South Dartmouth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Attleboro", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Plainville", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Attleboro Falls", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "North Dighton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Norton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Raynham", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Raynham Center", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Rehoboth", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Rochester", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Seekonk", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Swansea", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Berkley", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Taunton", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Westport", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Westport Point", stateAbbrev = "MA", state = "Massachusetts" }
    , { city = "Adamsville", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Albion", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Ashaway", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Barrington", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Block Island", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Bradford", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Bristol", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Carolina", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Charlestown", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Chepachet", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Clayville", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Coventry", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "West Greenwich", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "East Greenwich", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Exeter", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Fiskeville", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Forestdale", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Foster", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Glendale", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Greene", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Greenville", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Harmony", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Harrisville", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Hope", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Hope Valley", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Hopkinton", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Jamestown", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Kenyon", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Little Compton", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Manville", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Mapleville", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Newport", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "NETC", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Middletown", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "North Kingstown", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "North Scituate", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Oakland", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Pascoag", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Pawtucket", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Central Falls", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Cumberland", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Lincoln", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Portsmouth", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Prudence Island", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Rockville", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Saunderstown", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Shannock", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Slatersville", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Slocum", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Tiverton", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Wakefield", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Kingston", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Narragansett", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Peace Dale", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Warren", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Warwick", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Westerly", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "West Kingston", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "West Warwick", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Wood River Junction", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Woonsocket", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "North Smithfield", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Wyoming", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Providence", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Cranston", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "North Providence", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Providence", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "East Providence", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Riverside", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Rumford", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Smithfield", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Providence", stateAbbrev = "RI", state = "Rhode Island" }
    , { city = "Johnston", stateAbbrev = "RI", state = "Rhode Island" }
    ]
