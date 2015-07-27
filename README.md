#  Study Design

The study design is described by the file README.txt that is included with the raw data. The following is excerted from that file.

```
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
```

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

The raw data is avaiable at [Human Activity Recognition Using SmartPhones Data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

# Code Book

As described above, the dataset was captured for a set of 30 subjects performing six different activities. The raw dataset consists of gyro and accelerometer sensor data acquired from Samsung phones attached to the subjects waste. This data was processed as described in the raw data README.txt file to produce a vector of 561 features for each observation. The individual features are described in the raw data files features.txt and features_info.txt. The data was provided in a set of three tables for each of the test and training data sets. These tables contained the subject, the activity being performed and the feature vector for each observation.

The tidy dataset for the Smartphone Dataset was prepared by combining the subject, activity and feature vector into a single table. The first column for trhe combined table was the subject, the second column was the activity being performed and the remaining 561 columns were the corresponding feature vector. The feature columns were labeled with the appropriate feature name. Finally, only the feature columns containing mean or std data were retained. 

The combined test and traing tables were then concatenated to form a single table with the same columns as the original, but with all the observations from both the original test and training datasets. The resulting dataset was grouped by subject and activity and the features were averaged within the group. The resulting feature columns (which contain the mean of the features within a group) were renamed by pre-pending a 'M' to the original name of the feature. For example, `tBodyAcc.mean()-X` was renamed to `MtBodyAcc.mean...X`. (Note that the characters '(', ')' and '-', which are not legal names in R, where replaced with a '.'.

The resulting table has one observation for each combination of subject and activity which contains the averaged feature data for all observations of the subject, activity pair. The following shows the first 20 observations in the final tidy dataset. Only the first 3 features are shown.

```
> head(R, n=20)[,1:5]
Source: local data frame [20 x 5]
Groups: subject

   subject           activity MtBodyAcc.mean...X MtBodyAcc.mean...Y MtBodyAcc.mean...Z
1        1             LAYING          0.2215982       -0.040513953        -0.11320355
2        1            SITTING          0.2612376       -0.001308288        -0.10454418
3        1           STANDING          0.2789176       -0.016137590        -0.11060182
4        1            WALKING          0.2773308       -0.017383819        -0.11114810
5        1 WALKING_DOWNSTAIRS          0.2891883       -0.009918505        -0.10756619
6        1   WALKING_UPSTAIRS          0.2554617       -0.023953149        -0.09730200
7        2             LAYING          0.2813734       -0.018158740        -0.10724561
8        2            SITTING          0.2770874       -0.015687994        -0.10921827
9        2           STANDING          0.2779115       -0.018420827        -0.10590854
10       2            WALKING          0.2764266       -0.018594920        -0.10550036
11       2 WALKING_DOWNSTAIRS          0.2776153       -0.022661416        -0.11681294
12       2   WALKING_UPSTAIRS          0.2471648       -0.021412113        -0.15251390
13       3             LAYING          0.2755169       -0.018955679        -0.10130048
14       3            SITTING          0.2571976       -0.003502998        -0.09835792
15       3           STANDING          0.2800465       -0.014337656        -0.10162172
16       3            WALKING          0.2755675       -0.017176784        -0.11267486
17       3 WALKING_DOWNSTAIRS          0.2924235       -0.019355408        -0.11613984
18       3   WALKING_UPSTAIRS          0.2608199       -0.032410941        -0.11006486
19       4             LAYING          0.2635592       -0.015003184        -0.11068815
20       4            SITTING          0.2715383       -0.007163065        -0.10587460
```
