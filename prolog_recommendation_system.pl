% FACTS

% Search history of users
search_history(john, [iphone_14, galaxy_tab_a8, samsung_galaxy_a34, xiaomi_redmi_12C, motorola_g23]).
search_history(lisa, [galaxy_tab_a8, samsung_galaxy_a14, xiaomi_redmi_12C, samsung_galaxy_s23]).
search_history(mark, [iphone_14, iphone_11, iphone_14_pro, xiaomi_redmi_note_12, iphone_14_pro_max]).
search_history(paul, [ok_24GH_5023C, panasonic_TX24MS350E, samsung_QE50Q80BATXZT, lg_uhd_43UR78006LK]).
search_history(max, [ok_24GH_5023C, galaxy_tab_a8, philips_24PFS5535_12, samsung_QE50Q60BAUXZT, sony_KD50X75WL]).
search_history(charles, [iphone_14, sony_KD50X75WL, samsung_galaxy_a14, xiaomi_redmi_note_12, galaxy_tab_a7, galaxy_tab_s8]).

% Categorization of products
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

% Price facts for products
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

% User ratings for products
% user_rating(User, Product, Rating).
user_rating(john, iphone_14, 4.5).
user_rating(john, galaxy_tab_a8, 3.0).
user_rating(john, samsung_galaxy_a34, 4.0).
user_rating(lisa, galaxy_tab_a8, 4.5).
user_rating(lisa, samsung_galaxy_a14, 3.5).
user_rating(mark, iphone_14, 5.0).
user_rating(mark, iphone_11, 4.0).
user_rating(mark, iphone_14_pro, 4.5).
user_rating(paul, ok_24GH_5023C, 3.0).
user_rating(paul, panasonic_TX24MS350E, 4.0).
user_rating(paul, samsung_QE50Q80BATXZT, 4.5).
user_rating(max, ok_24GH_5023C, 4.5).
user_rating(max, galaxy_tab_a8, 3.5).
user_rating(max, philips_24PFS5535_12, 4.0).
user_rating(charles, iphone_14, 4.0).
user_rating(charles, sony_KD50X75WL, 3.5).
user_rating(charles, galaxy_tab_a7, 3.0).

% RULES

% Calculate the Pearson correlation coefficient between two lists of ratings
pearson_correlation(User1Ratings, User2Ratings, Similarity) :-
    length(User1Ratings, N),
    length(User2Ratings, N),
    sum_ratings(User1Ratings, Sum1),
    sum_ratings(User2Ratings, Sum2),
    sum_squared_ratings(User1Ratings, SumSquared1),
    sum_squared_ratings(User2Ratings, SumSquared2),
    sum_product_ratings(User1Ratings, User2Ratings, SumProduct),
    Numerator is N * SumProduct - Sum1 * Sum2,
    Denominator1 is sqrt(N * SumSquared1 - Sum1 * Sum1),
    Denominator2 is sqrt(N * SumSquared2 - Sum2 * Sum2),
    Denominator is Denominator1 * Denominator2,
    (Denominator = 0 -> Similarity = 0 ; Similarity is Numerator / Denominator).

% Calculate the sum of ratings in a list
sum_ratings([], 0).
sum_ratings([Rating|Rest], Sum) :-
    sum_ratings(Rest, RestSum),
    Sum is RestSum + Rating.

% Calculate the sum of squared ratings in a list
sum_squared_ratings([], 0).
sum_squared_ratings([Rating|Rest], Sum) :-
    sum_squared_ratings(Rest, RestSum),
    Sum is RestSum + Rating * Rating.

% Calculate the sum of product of ratings between two lists
sum_product_ratings([], [], 0).
sum_product_ratings([Rating1|Rest1], [Rating2|Rest2], Sum) :-
    sum_product_ratings(Rest1, Rest2, RestSum),
    Sum is RestSum + Rating1 * Rating2.

% Remove duplicate recommendations from the list
remove_duplicates([], []).
remove_duplicates([[Product, Category, Price]|Tail], [[Product, Category, Price]|Result]) :-
    remove_duplicates(Tail, Result).

% Format the recommendations as a list of formatted strings
format_recommendations([], []).
format_recommendations([[Product, Category, Price]|Tail], [Formatted|Result]) :-
    format(atom(Formatted), "Product Name: ~w, Category: ~w, Price: ~2f", [Product, Category, Price]),
    format_recommendations(Tail, Result).

% Collaborative filtering algorithm with user ratings
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
    ), ExistingRecommendations),
    % Retrieve user's ratings for products
    findall(Rating, user_rating(User, _, Rating), UserRatings),
    % Collaborative filtering: Find similar users based on their ratings
    findall(SimilarUser, (
        user_rating(SimilarUser, _, _),
        SimilarUser \= User,
        findall(SimilarRating, user_rating(SimilarUser, _, SimilarRating), SimilarRatings),
        pearson_correlation(UserRatings, SimilarRatings, Similarity),
        Similarity > 0.3 % Minimum similarity threshold (adjust as needed)
    ), SimilarUsers),
    % Find products that the similar users have searched for and add them to recommendations
    findall([Product, Category, Price], (
        member(SimilarUser, SimilarUsers),
        search_history(SimilarUser, SimilarSearchHistory),
        member(Product, SimilarSearchHistory),
        category(Product, Category),
        price(Product, Price),
        \+ member([Product, Category, Price], ExistingRecommendations), % Exclude already recommended products
        (MinPrice =< 0.0 ; Price >= MinPrice),
        (MaxPrice =< 0.0 ; Price =< MaxPrice),
        (CategoryFilter = 'skip' ; CategoryFilter = Category)
    ), CollaborativeRecommendations),
    % Combine and sort the collaborative recommendations
    sort(CollaborativeRecommendations, SortedCollaborativeRecommendations),
    % Combine and sort the existing recommendations
    sort(ExistingRecommendations, SortedExistingRecommendations),
    % Merge the collaborative and existing recommendations
    append(SortedCollaborativeRecommendations, SortedExistingRecommendations, AllRecommendations),
    % Remove duplicate recommendations
    remove_duplicates(AllRecommendations, UniqueRecommendations),
    % Format the recommendations for display
    format_recommendations(UniqueRecommendations, Recommendation).

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



