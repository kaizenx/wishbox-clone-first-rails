User.create!([
  {email: "tzuchjeh@gmail.com", password: "1h@swarhammer40k", password_confirmation: "1h@swarhammer40k",reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 58, current_sign_in_at: "2014-03-28 16:29:16", last_sign_in_at: "2014-03-27 17:38:38", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: nil, admin: true, provider: nil, uid: nil},
  {email: "saramak628811@gmail.com", password: "system1234", password_confirmation: "system1234",reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-02-27 08:57:53", last_sign_in_at: "2014-02-27 08:57:53", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: nil, admin: true, provider: nil, uid: nil},
  {email: "aaron.sarma@gmail.com", password: "system1234", password_confirmation: "system1234",reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-02-27 08:58:18", last_sign_in_at: "2014-02-27 08:58:18", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: nil, admin: true, provider: nil, uid: nil},
  {email: "anrisuzuki@outlook.com", password: "system1234", password_confirmation: "system1234",reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2014-02-27 16:36:50", last_sign_in_at: "2014-02-27 08:58:43", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: nil, admin: nil, provider: nil, uid: nil},
  {email: "tanseken@gmail.com", password: "system1234", password_confirmation: "system1234",reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-02-27 09:04:54", last_sign_in_at: "2014-02-27 09:04:54", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: nil, admin: true, provider: nil, uid: nil}
])
Category.create!([
  {Name: "Flights"},
  {Name: "Hotels"},
  {Name: "Deals"},
  {Name: "Shopping"},
  {Name: "Souveniers"},
  {Name: "Events"}
])
Destination.create!([
  {FeedId: 2, Name: "Ubud"},
  {FeedId: 3, Name: "Wat Pho"}
])
Feed.create!([
  {UserId: "1", IsAdmin: true, IsSponsor: false, restricted: false, ImageUrl: "/uploads/gallery/image/1/Gift.jpg", Title: "Bali", Subtitle: "Indonesia", IsPublished: true, Description: "Indonesia", slug: "bali", lat: nil, lng: nil, Blurb: nil},
  {UserId: "1", IsAdmin: true, IsSponsor: true, restricted: false, ImageUrl: "/uploads/gallery/image/3/thai.jpg", Title: "Bangkok", Subtitle: "Thailand", IsPublished: true, Description: "Lucky you - five days will allow you to tick off all the sights in your glossy guidebook, do an unholy amount of shopping, take a trip out of town and even find a little time to relax. Bangkok is a nuanced city, and you'll have time to see why, to experience the cultural subtleties that make it such an enjoyable destination. Alternatively, you could just party hard or indulge the many sensory pleasures on offer, from wonderful food to luxurious spas. This 5 day mini-guide will give you plenty of ideas. We hope it throws up many exciting and enriching suggestions.", slug: "bangkok", lat: "1.0", lng: "2.0", Blurb: "the magic of bangkok"},
  {UserId: "1", IsAdmin: true, IsSponsor: false, restricted: true, ImageUrl: "/uploads/gallery/image/2/batu-ferringhi-beach-penang-malaysia-21284637.jpg", Title: "Penang", Subtitle: "Penang", IsPublished: true, Description: "Penang", slug: "Penang", lat: "2.0", lng: "3.0", Blurb: ""}
])
FeedDestination.create!([
  {FeedId: 2, Name: "Umut", IsActive: nil}
])
Gallery.create!([
  {name: "gift", feeid: 2, productid: nil, image: "Gift.jpg"},
  {name: "Batu Ferringhi", feeid: nil, productid: nil, image: "batu-ferringhi-beach-penang-malaysia-21284637.jpg"},
  {name: "Bangkok", feeid: 3, productid: nil, image: "thai.jpg"},
  {name: "Shopping", feeid: nil, productid: 1, image: "WatPho_1193.JPG"},
  {name: "thaipusam picture", feeid: nil, productid: nil, image: "thaipu21.jpg"},
  {name: "holiday", feeid: nil, productid: nil, image: "holidays-2013.jpg"}
])
Itinerary.create!([
  {UserId: 9, ProductId: 4, TripId: 78},
  {UserId: 9, ProductId: 4, TripId: 78},
  {UserId: 9, ProductId: 4, TripId: 78},
  {UserId: 9, ProductId: 4, TripId: 78}
])
Merchant.create!([
  {Name: "Bob Smith", Title: "Mr", CompanyName: "Walmart", Address: "1", Country: "Malaysia", ContactPhone: "1", MobilePhone: "1", Email: "bobsmith@walmart.com", Password: "1"},
  {Name: "Wishable", Title: "Mr", CompanyName: "Wishable", Address: "Wishable", Country: "Malaysia", ContactPhone: "011 1111 111", MobilePhone: "011 1111 111", Email: "Wishable", Password: "1"}
])
Order.create!([
  {UserId: 1, PaymentId: nil, PaymentPortal: nil, Amount: nil, PayerId: nil, GatewayPrice: nil, GatewayCurrency: nil},
  {UserId: 1, PaymentId: nil, PaymentPortal: nil, Amount: nil, PayerId: nil, GatewayPrice: nil, GatewayCurrency: nil}
])

Product.create!([
  {Title: "Shopping", SubTitle: "Ski holiday subtitle", ImageURL: "/uploads/gallery/image/4/WatPho_1193.JPG", TargetURL: "", Wants: nil, CreatedByUserId: 1, Currency: "myr", Price: "20.0", IsPublished: false, MerchantId: "2", SKUId: "", Category: "6", StartDate: "2014-01-01 00:00:00", EndDate: "2015-01-01 00:00:00", DestinationId: 2, Description: "Wat Pho is named after a monastery in India where Buddha is believed to have lived.[5] Prior to the temple's founding, the site was a centre of education for traditional Thai medicine, and statues were created showing yoga positions. An enormous Buddha image from Ayuthaya's Wat Phra Si Sanphet was destroyed by the Burmese in 1767; King Rama I (1782-1809 A.D.) incorporated its fragments to build a temple to enlarge and renovate the complex.[6] The complex underwent many changes in the next 260 years. Under King Rama III (1824-1851 A.D.), plaques inscribed with medical texts were placed around the temple.[7] These received recognition in the Memory of the World Programme launched by UNESCO on February 21, 2008.[8] Adjacent to the building housing the Reclining Buddha is in a small raised garden, the centrepiece being a bodhi tree which is propagated from the original tree in India where Buddha sat while awaiting enlightenment. The temple was created as a restoration of an earlier temple on the same site, Wat Phodharam, with the work beginning in 1788. The temple was restored and extended in the reign of King Rama III, and was restored again in 1982.", Highlights: "Shopping Highlights", Condition: "Shopping Condition", BasePrice: "40.0", DiscountPercentage: 50, slug: "wat-pho", IsInfinite: true, Blurb: nil},
  {Title: "Thaipusam", SubTitle: "Cultural holiday", ImageURL: "/uploads/gallery/image/5/thaipu21.jpg", TargetURL: "http://www.tourism.gov.my/en/my/web-page/experiences", Wants: nil, CreatedByUserId: 1, Currency: "myr", Price: "15.0", IsPublished: false, MerchantId: "2", SKUId: "", Category: "", StartDate: "2014-01-01 00:00:00", EndDate: "2015-01-01 00:00:00", DestinationId: 2, Description: "Thaipusam \"Thaipoosam\" (Tamil: தைப்பூசம், Taippūcam ?)is a Hindu festival celebrated mostly by the Tamil community on the full moon in the Tamil month of Thai (January/February). It is mainly observed in countries where there is a significant presence of Tamil community such as India, Sri Lanka, Malaysia,[1] Mauritius[2] Singapore, Indonesia, Thailand and Myanmar[3]\r\n\r\nThe word Thaipusam is a combination of the name of the month, Thai, and the name of a star, Pusam. This particular star is at its highest point during the festival. The festival commemorates the occasion when Parvati gave Murugan a Vel \"spear\" so he could vanquish the evil demon Soorapadman. There is a misconception among people that Thaipusam marks Murugan's birthday; however, it is believed that Vaikhasi Vishakam, which falls in the Vaikhasi month (May/June), is Murugan's birthday.[4]", Highlights: "", Condition: "", BasePrice: "30.0", DiscountPercentage: 50, slug: "thaipusam", IsInfinite: true, Blurb: nil},
  {Title: "Monkey forest", SubTitle: "Buy stuff", ImageURL: "/uploads/gallery/image/2/batu-ferringhi-beach-penang-malaysia-21284637.jpg", TargetURL: "http://www.dailymail.co.uk/travel/article-616475/Shopping-bargains-New-York-despite-sterling-slump.html", Wants: 2, CreatedByUserId: 1, Currency: "myr", Price: "20.0", IsPublished: false, MerchantId: "2", SKUId: "", Category: "", StartDate: "2014-01-01 00:00:00", EndDate: "2015-01-01 00:00:00", DestinationId: 2, Description: "Tourist development in Padangtegal village basically uses tourist cultural concept. That concept is chosen with consideration, that this village has art and culture potential. Moreover, both things are used as the main appeal for making tourists come to Padangtegal and one of interesting place to visit is monkey forest area. Because of that reason, that is why every steps to develop of tourist industry which is hoped to care our art and culture also make these as village assets. Furthermore, there is a moral responsibility to have policies for using our art and culture potentials, take as examples, for using Balinese style in architecture, souvenir and promotion goods.", Highlights: "", Condition: "", BasePrice: "30.0", DiscountPercentage: 33, slug: "monkey-forest", IsInfinite: true, Blurb: nil}
])
ProductInFeed.create!([
  {productid: 2, feedid: 3},
  {productid: 4, feedid: 3},
  {productid: 1, feedid: 2},
  {productid: 2, feedid: 2},
  {productid: 3, feedid: 2},
  {productid: 4, feedid: 2},
  {productid: 1, feedid: 3}
])
UserDetail.create!([
  {FirstName: nil, LastName: nil, Age: nil, Email: "uacbrvu_fallerson_1394718618@tfbnw.net", UserId: 9, StreetAddr: nil, State: nil, City: nil, Zipcode: nil, Country: nil, Income: nil, Gender: nil, IsReceiveWeekly: nil, IsReceiveTripUpdate: nil, IsReceiveTripUserUpdate: nil, IsReceivePromo: nil}
])
Trip.create!([
  {userid: 9, feedid: 3, TripCreator: 9, DestinationId: "2", StartDate: "2014-04-10 00:00:00", EndDate: "2014-04-14 00:00:00"},
  {userid: 9, feedid: 3, TripCreator: 9, DestinationId: "2", StartDate: "2014-03-03 00:00:00", EndDate: "2014-03-29 00:00:00"},
  {userid: 9, feedid: 3, TripCreator: 9, DestinationId: "2", StartDate: "2014-03-04 00:00:00", EndDate: "2014-03-14 00:00:00"},
  {userid: 1, feedid: 3, TripCreator: 1, DestinationId: "2", StartDate: "2014-03-03 00:00:00", EndDate: "2014-03-20 00:00:00"}
])
UserShoppingCart.create!([
  {userid: 9, productid: 4, isshow: true, IsBought: false, Title: "Monkey forest", Price: "20.0", VoucherCode: nil, Quantity: 2, OrderId: nil, TripId: 78}
])
