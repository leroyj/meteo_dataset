from numpy import genfromtxt
my_data = genfromtxt('meteo_dataset.txt', delimiter=';', dtype="f8,S6", names=True)
(temp,label)=my_data['t'],my_data['season']

from keras import models
from keras import layers

network = models.Sequential()
network.add(layers.Dense(512, activation='relu',input_dim = 1))
network.add(layers.Dense(4, activation='softmax'))
#definition de la fonction de perte et de l'algo d'optim
network.compile(optimizer='rmsprop',loss='categorical_crossentropy',metrics=['accuracy'])
#normalization


#encodage des labels
from keras.utils import to_categorical

#label = to_categorical(label)


network.fit(temp, label,epochs=5, batch_size=128)

test_loss, test_acc = network.evaluate(temp, label)
print ('test_acc:', test_acc)

