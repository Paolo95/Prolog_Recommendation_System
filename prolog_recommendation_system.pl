% FACTS

% SEARCH HISTORY OF USERS

% John is a user that searched for a smartphone and a tablet
search_history(john, [iphone_14, galaxy_tab_a8]).

% Lisa is a user that searched for a tablet
search_history(lisa, [galaxy_tab_a8]).

% Mark is a user that searched for a smartphone
search_history(mark, [iphone_14]).

% Paul is a user that searched for a TV
search_history(paul, [ok_24GH_5023C]).

% Max is a user that searched for a TV and a tablet
search_history(max, [ok_24GH_5023C, galaxy_tab_a8]).

% Charles is a user that searched for a smartphone and a TV
search_history(charles, [iphone_14, sony_KD50X75WL]).

% CATEGORIZATION OF SMARTPHONE PRODUCTS
category(iphone_14, smartphone).
category(samsung_galaxy_a34, smartphone).
category(samsung_galaxy_a54, smartphone).
category(samsung_galaxy_a14, smartphone).
category(xiaomi_redmi_12C, smartphone).
category(iphone_11, smartphone).
category(iphone_14_pro, smartphone).
category(samsung_galaxy_s23, smartphone).
category(xiaomi_redmi_note_12_pro, smartphone).
category(motorola_g23, smartphone).
category(xiaomi_redmi_note_12, smartphone).
category(iphone_14_pro_max, smartphone).
category(xiaomi_redmi_note_12, smartphone).
category(xiaomi_redmi_10C, smartphone).
category(iphone_13_mini, smartphone).
category(realme_11_pro, smartphone).
category(realme_c53, smartphone).
category(motorola_edge_30, smartphone).
category(iphone_13_mini, smartphone).
category(realme_10, smartphone).

% CATEGORIZATION OF TABLET PRODUCTS
category(galaxy_tab_a8, tablet).
category(galaxy_tab_a7, tablet).
category(galaxy_tab_s8, tablet).
category(ipad_10_2, tablet).
category(galaxy_tab_s6, tablet).
category(mediacom_x10, tablet).
category(lenovo_m10, tablet).
category(galaxy_tab_s7, tablet).
category(lenovo_p11, tablet).
category(galaxy_tab_s6_lite, tablet).


% CATEGORIZATION OF TV PRODUCTS
category(ok_24GH_5023C, tv).
category(philips_24PFS5535_12, tv).
category(panasonic_TX24MS350E, tv).
category(samsung_QE50Q80BATXZT, tv).
category(lg_uhd_43UR78006LK, tv).
category(panasonic_TX24G310E, tv).
category(xiaomi_P1_E_32, tv).
category(sony_KD43X80L, tv).
category(samsung_UE55AU7090UXZT, tv).
category(sony_KD50X75WL, tv).
category(samsung_QE50Q60BAUXZT, tv).


% SMARTPHONE PRODUCTS' PRICE FACTS
price(iphone_14, 859.0).
price(samsung_galaxy_a34, 305.99).
price(samsung_galaxy_a54, 449.99).
price(samsung_galaxy_a14, 152.99).
price(xiaomi_redmi_12C, 122.99).
price(iphone_11, 554.99).
price(iphone_14_pro, 1199.0).
price(samsung_galaxy_s23, 1299.0).
price(xiaomi_redmi_note_12_pro, 120.0).
price(motorola_g23, 179.0).
price(xiaomi_redmi_note_12, 199.0).
price(iphone_14_pro_max, 1349.0).
price(xiaomi_redmi_note_12, 199.0).
price(xiaomi_redmi_10C, 99.0).
price(iphone_13_mini, 749.0).
price(realme_11_pro, 449.99).
price(realme_c53, 179.0).
price(motorola_edge_30, 269.99).
price(iphone_13_mini, 749.0).
price(realme_10, 229.99).


% TABLET PRODUCTS' PRICE FACTS
price(galaxy_tab_a8, 229.99).
price(galaxy_tab_a7, 149.0).
price(galaxy_tab_s8, 649.0).
price(ipad_10_2, 369.99).
price(galaxy_tab_s6, 349.99).
price(mediacom_x10, 109.99).
price(lenovo_m10, 239.99).
price(galaxy_tab_s7, 459.0).
price(lenovo_p11, 299.99).
price(galaxy_tab_s6_lite, 399.99).


% TV PRODUCTS' PRICE FACTS
price(ok_24GH_5023C, 119.99).
price(philips_24PFS5535_12, 259.99).
price(panasonic_TX24MS350E, 229.99).
price(samsung_QE50Q80BATXZT, 510.99).
price(lg_uhd_43UR78006LK, 329.99).
price(panasonic_TX24G310E, 159.99).
price(xiaomi_P1_E_32, 179.99).
price(sony_KD43X80L, 799.99).
price(samsung_UE55AU7090UXZT, 398.99).
price(sony_KD50X75WL, 599.99).
price(samsung_QE50Q60BAUXZT, 489.99).

% RULES

% The recommend/5 predicate recommends products to a user based on their search history,
% price range, and category filter.
recommend(User, MinPrice, MaxPrice, CategoryFilter, Recommendation) :-
    search_history(User, SearchHistory),
    % Find all products that match the user's search history, category, and price range
    findall([Product, Category, Price], (
        member(Product, SearchHistory),
        category(Product, Category),
        price(Product, Price),
        (MinPrice =< 0.0 ; Price >= MinPrice),
        (MaxPrice =< 0.0 ; Price =< MaxPrice),
        (CategoryFilter = 'skip' ; CategoryFilter = Category)
    ), Recommendations),
    % Find related products that have the same category as the user's search history
    findall([RelatedProduct, Category, RelatedPrice], (
        member(Product, SearchHistory),
        category(Product, Category),
        category(RelatedProduct, Category),
        price(RelatedProduct, RelatedPrice),
        \+ member([RelatedProduct, _, _], Recommendations),
        (MinPrice =< 0.0 ; RelatedPrice >= MinPrice),
        (MaxPrice =< 0.0 ; RelatedPrice =< MaxPrice),
        (CategoryFilter = 'skip' ; CategoryFilter = Category)
    ), RelatedRecommendations),
    % Combine and sort the recommendations
    append(Recommendations, RelatedRecommendations, AllRecommendations),
    sort(AllRecommendations, SortedRecommendations),
    % Remove duplicate recommendations
    remove_duplicates(SortedRecommendations, UniqueRecommendations),
    % Format the recommendations for display
    format_recommendations(UniqueRecommendations, Recommendation).

% Format the recommendations as a list of formatted strings
format_recommendations([], []).
format_recommendations([[Product, Category, Price]|Tail], [Formatted|Result]) :-
    format(atom(Formatted), "Product Name: ~w, Category: ~w, Price: ~2f", [Product, Category, Price]),
    format_recommendations(Tail, Result).

% Remove duplicate recommendations from the list
remove_duplicates([], []).
remove_duplicates([[Product, Category, Price]|Tail], [[Product, Category, Price]|Result]) :-
    remove_duplicates(Tail, Result).


% Main entry point of the program
:- initialization(main).

main :-
    write('Enter your username: '),
    read(User),
    (   search_history(User, _)    % Check if the user exists in the search history
    ->  (
            write('Enter the minimum price (or type "skip" to skip): '),
            read(MinPriceInput),
            parse_price_input(MinPriceInput, MinPrice),
            write('Enter the maximum price (or type "skip" to skip): '),
            read(MaxPriceInput),
            parse_price_input(MaxPriceInput, MaxPrice),
            write('Enter the category (or type "skip" to skip): '),
            read(CategoryFilter),
            (   category_exists(CategoryFilter)
            ->  recommend(User, MinPrice, MaxPrice, CategoryFilter, Recommendations),
                nl,
                write('Recommendations for '), write(User), write(':'), nl,
                print_recommendations(Recommendations)
            ;   write('Category not found. Using "skip" for category filter.'), nl,
                recommend(User, MinPrice, MaxPrice, 'skip', Recommendations),
                nl,
                write('Recommendations for '), write(User), write(':'), nl,
                print_recommendations(Recommendations)
            )
        )
    ;   write('User not found.')
    ).

% Parse the price input, converting "skip" to -1.0
parse_price_input(skip, -1.0) :- !.
parse_price_input(Value, ParsedValue) :-
    (   number(Value)
    ->  ParsedValue is float(Value)
    ;   write('Invalid price input. Skipping price filter.'), nl,
        ParsedValue = -1.0
    ).

% Print the list of recommendations
print_recommendations([]) :-
    nl,
    write('No suggestions.'), nl.
print_recommendations(Recommendations) :-
    print_recommendations_list(Recommendations).

% Print each recommendation in the list
print_recommendations_list([]).
print_recommendations_list([Recommendation|Tail]) :-
    write('- '), write(Recommendation), nl,
    print_recommendations_list(Tail).

% Check if a category exists
category_exists(Category) :-
    category(_, Category).

