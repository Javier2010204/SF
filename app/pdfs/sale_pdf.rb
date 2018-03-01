class SalePdf < Prawn::Document
	def initialize(sale, view)
		super(top_margin: 70)
		@sale = sale
		@view = view
		sale_number
		line_items
		total_price
	end

	def sale_number
		text "Factura \##{@sale.number}", size: 30, style: :bold
	end

	def line_items
		move_down 20
		table line_items_rows do 
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.header = true
		end
	end

	def line_items_rows
		[["Medicamento", "Cantidad", "Precio", "Sub-Total"]] +
		@sale.sale_details.map do |item|
			[item.item.item_description, item.qty, price(item.unit_price), price(item.subtotal)]
		end
		
	end

	def price(num)
		@view.number_to_currency(num)
	end

	def total_price
		move_down 15
		text "Total:#{price(@sale.total)}", size: 16, style: :bold
	end
end