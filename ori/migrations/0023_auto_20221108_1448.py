# Generated by Django 3.2.15 on 2022-11-08 13:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ori', '0022_alter_departamento_nombredepartamento'),
    ]

    operations = [
        migrations.AlterField(
            model_name='institucion',
            name='nombreinstitucion',
            field=models.CharField(default='UGR', max_length=200, unique=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='partnershipagreement',
            name='estado',
            field=models.CharField(max_length=100, unique=True),
        ),
        migrations.AlterField(
            model_name='periodicidad',
            name='periodosanuales',
            field=models.IntegerField(unique=True),
        ),
        migrations.AlterField(
            model_name='periodicidad',
            name='tipo_periodicidad',
            field=models.CharField(max_length=40, unique=True),
        ),
        migrations.AlterField(
            model_name='rol',
            name='rolename',
            field=models.CharField(max_length=200, unique=True),
        ),
    ]
