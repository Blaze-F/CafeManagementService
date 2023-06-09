# Generated by Django 3.1.14 on 2023-04-15 07:10

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('password', models.CharField(max_length=255)),
                ('phone', models.CharField(max_length=13)),
                ('name', models.CharField(max_length=20)),
            ],
            options={
                'db_table': 'user',
            },
        ),
    ]
