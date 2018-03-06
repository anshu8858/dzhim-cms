### / [dzhim-cms](./../../) / [docs](./../) / [Framework](./)

-----------------------------------------------------------------------------------

# Dzhim CMS framework

## File structure

* `fmw/mod` - Your custom input / output modules, including table structure and layout. Example, product, partner, static.
* `fmw/common` - Additional files that are not in the core functionality and needs to be accessible from anywhere. Example, layouts, models like 'Products' or 'Parnters'.
* `pub` - Publicly available content.
* `pub/res` - Resources like images and files.
* `pub/ui` - **U**ser **I**nterface related content like CSS or JS.
* `pub/kcf` - KCFinder's directory, required to provide the image management in the admin.

------------------------

* `fmw/core` - Framework's core classes.

## Admin

* [http://dzhim-cms.local/admin](http://dzhim-cms.local/admin).
* Email: admin@dzhim-cms.local
* Password: admin

## Dependencies
* Smarty 3.1.13
* ckeditor 4.3.3
* kcfinder v.2.51
* jQuery v.1.8.3

## Some ORM actions

```php
$model->insert()
$model->update();
```

### Select

```php
$model->findOne
$model->findList
```

### Filters

Set `$model->_filter = 1` and then set field values like ID
`$model->name = 'John'`;

```php
$st->_op = array('parent_id' => 'IS');
```

### Order

```php
$model->_order;
```
