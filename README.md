### Basic Yelp client

This is a headless example of how to implement an OAuth 1.0a Yelp API client. The Yelp API provides an application token that allows applications to make unauthenticated requests to their search API.

### Next steps

- Check out `BusinessesViewController.swift` to see how to use the `Business` model.

### Sample request

**Basic search with query**

```
Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
    self.businesses = businesses
    
    for business in businesses {
        print(business.name!)
        print(business.address!)
    }
})
```

**Advanced search with categories, sort, and deal filters**

```
Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in

    for business in businesses {
        print(business.name!)
        print(business.address!)
    }
}
```
# Project 3 - *Name of App Here*

**Name of your app** is a Yelp search app using the [Yelp API](http://www.yelp.com/developers/documentation/v2/search_api).

Time spent: **X** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] Table rows for search results should be dynamic height according to the content height.
- [X] Custom cells should have the proper Auto Layout constraints.
- [X] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).

The following **optional** features are implemented:

- [ ] Search results page
- [ ] Infinite scroll for restaurant results.
- [X] Implement map view of restaurant results.
- [ ] Implement the restaurant detail page.

The following **additional** features are implemented:

- [X] User is allowed to specify what type of food he or she wants (currently, this only happens once).

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Order of placing constraints for labels, etc.
2. I would like to go over AutoLayout again with my peers and hear what their experiences were like.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/AbrR8rp.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

1. Modifying the Info.plist...I always get the "parsing error" and somehow end up fixing but I am still not sure about it.

## License

    Copyright [2016] [Santos Solorzano]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
