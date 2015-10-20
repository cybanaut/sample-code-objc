//
//  MapEventController.m
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "MapEventController.h"
#import "MegaTheme.h"
#import "EventModel.h"
#import "EventCell.h"
@interface MapEventController ()

@end

@implementation MapEventController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    
    placeImageView.image = [UIImage imageNamed:@"club"];
    
    placeLabel.text = @"Club El Camino";
    placeLabel.font = [UIFont fontWithName:MegaTheme.fontName size: 18];
    placeLabel.textColor = [UIColor blackColor];
    
    addressLabel.text = @"Paris, France";
    addressLabel.font = [UIFont fontWithName:MegaTheme.fontName size: 13];
    addressLabel.textColor = [UIColor colorWithWhite:0.43 alpha: 1.0];
    
    locationIconImageView.image = [[UIImage imageNamed:@"location" ] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    locationIconImageView.tintColor = [UIColor colorWithWhite:0.43 alpha: 1.0];
    locationIconImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    distanceLabel.text = @"1.4Km";
    distanceLabel.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size:14];
    distanceLabel.textColor = [UIColor whiteColor];
    distanceLabelContainer.backgroundColor = [UIColor colorWithRed:0.34 green: 0.80 blue: 0.80 alpha: 1.0];
    distanceLabelContainer.layer.cornerRadius = 4;
    
    eventsTableView.dataSource = self;
    eventsTableView.delegate = self;
    eventsTableView.estimatedRowHeight = 100.0;
    eventsTableView.rowHeight = UITableViewAutomaticDimension;
    eventsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    EventModel* event1 = [[EventModel alloc] initWithTitle:@"Kasabian, The Group" type:@"concert" time:@"22.30" description:@"Kasabian draw an eclectic crowd, from men with their parents in fleeces to young lads sweating in retro sportswear. The glue that brings them together is a fierce adoration of a four-piece rock band from Leicester. The allure for them is so sticky that 25,000 of them will pour into Brixton Academy over five nights."];
    
    
    EventModel* event2 = [[EventModel alloc] initWithTitle:@"Summer Poolside Party" type:@"club" time:@"21:00" description:@"Pop has always had its ageing production wizards, and 47-year-old French DJ David Guetta is one of the key figures in modern chart music. His seventh album offers a dynamic snapshot of the mainstream 21st-century sound: bright, squashed and thumping club beats."];
    
    EventModel* event3 = [[EventModel alloc] initWithTitle:@"Lenny Kravitz Live" type:@"concert" time:@"22.45" description:@"ravitz turned 50 in May, but you would hardly know it. His fruitful career has seen him revel in the rich influences of Sixties and Seventies soul, funk and rock. Though he's still writing music, he has carved out an acting career more recently, starring in critically acclaimed films such as Precious, The Hunger Games and The Butler."];
    
    events = @[event1, event2, event3];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(51.50722, -0.1275);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    
    MKCoordinateRegion region =  MKCoordinateRegionMake(coordinate, span);
    
    [self.mapView setRegion:region animated:YES];

    ADVMapAnnotation* annotation = [[ADVMapAnnotation alloc] initWithTitle:@"El Camino" subtitle: @"Live music, Concert shows and more" coordinate: coordinate];

    [self.mapView addAnnotation:annotation];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return events.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventCell* cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell"];
    
    EventModel* event = events[indexPath.row];
    
    cell.titleLabel.text = event.title;
    cell.timeLabel.text = event.time;
    cell.descriptionLabel.text = event.eventDescription;
    cell.typeImageView.image = [event.type isEqualToString:@"club"] ? [UIImage imageNamed:@"event-club"] : [UIImage imageNamed:@"event-concert"];
    
    return cell;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    if([annotation isKindOfClass:[ADVMapAnnotation class]]) {
        
        MKAnnotationView* annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"Annotation"];
        
        if (annotationView == nil)
        {
            
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Annotation"];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"map-annotation"];
        }
        
        annotationView.annotation = annotation;
        
        return annotationView;
    }
    
    return nil;
}

@end

@implementation ADVMapAnnotation
-(instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle coordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    
    if (self) {
        
        self.ADVTitle = title;
        
        self.ADVSubTitle = subtitle;
        
        self.ADVCoordinate = coordinate;
        
    }
    return self;
}

-(NSString *)title
{
    return self.ADVTitle;
}

-(NSString *)subtitle
{
    
    return self.ADVSubTitle;
    
}
-(CLLocationCoordinate2D)coordinate
{
    return self.ADVCoordinate;
}

@end



