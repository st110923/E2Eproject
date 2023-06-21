{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## Project report\n",
    "We have data from Yandex.Realty classified https://realty.yandex.ru containing real estate listings for apartments in St. Petersburg and Leningrad Oblast from 2016 till the middle of August 2018. In this Lab you'll learn how to apply machine learning algorithms to solve business problems. Accurate price prediction can help to find fraudsters automatically and help Yandex.Realty users to make better decisions when buying and selling real estate.\n",
    "\n",
    "\n",
    "### Data description\n",
    "The data I've used for prediction model includes such features as open_plan, rooms,  area,  renovation.\n",
    "\n",
    "The preproccessing includes spliting dataset to train and validation datasets and cleaning the data with NaN values. Pipeline includes standartization by StandardScaler.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Model description\n",
    "\n",
    "I have tried the following models:\n",
    "    \n",
    "    DecisionTreeRegressor\n",
    "    LinearRegression\n",
    "    RandomForestRegressor\n",
    "    CatBoostRegressor\n",
    "    LGBMRegressor\n",
    "    ElasticNet\n",
    "    \n",
    "After comparing the mean prediction errors, the best model proved to be the LGBMRegressor.\n",
    "\n",
    "I have trained this model using the following Hyperparameters, tested in the following ranges:\n",
    "    \n",
    "    num_leaves: [3, 20],\n",
    "    reg_alpha: [0.1, 0.5],\n",
    "    min_data_in_leaf: [30, 50, 100, 300],\n",
    "    lambda_l1: [0, 1, 1.5],\n",
    "    lambda_l2: [0, 1].\n",
    "    "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### How to run app using docker and which port it uses"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "In order to access app an user should adress in browser the ip 51.250.20.134 with the port 5444 and set the values of the parameters of the query:\n",
    "\n",
    "open_plan\n",
    "rooms\n",
    "area\n",
    "renovation\n",
    "\n",
    "So, the command put in the browser shoul be as follows:\n",
    "\n",
    "51.250.20.134:5444/predict_price?open_plan=*&rooms=*&area=*&renovation=*\n",
    "\n",
    "where * are values of the corresponding parameters."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## Dockerfile content"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "FROM ubuntu:20.04\n",
    "MAINTAINER  Anna Kuzmina\n",
    "RUN apt-get update -y\n",
    "COPY . /opt/gsom_predictor\n",
    "WORKDIR /opt/gsom_predictor\n",
    "RUN apt install -y python3-pip\n",
    "RUN pip3 install -r requirments.txt\n",
    "CMD python3 app.py\n",
    "\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.9.6"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
