import pandas as pd
dataset = pd.read_csv('SalaryData.csv')
y = dataset['Salary']
x = dataset['YearsExperience']
X = x.values.reshape(30,1)
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.30, random_state=42)
from sklearn.linear_model import LinearRegression
model = LinearRegression()
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
from sklearn import metrics
accuracy=metrics.r2_score(y_test,y_pred)
accuracy=accuracy*100
print("your accuracy is :",accuracy)
with open('C:/Users/Rizz/Desktop/mlops_ws/accuracy.txt', 'w') as f:
    f.write(accuracy_str)