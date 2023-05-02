module BaseQuery
  extend ActiveSupport::Concern

  PER_PAGE = 20

  included do
    extend ClassMethods
  end

  module ClassMethods
    # Recebe os parâmetros recebidos da requisição e retorna o número de resultados por página deverá ser retornados pela busca.
    def per_page(params)
      params[:per_page].to_i.positive? ? params[:per_page].to_i : PER_PAGE
    end

    # Responsável por executar a busca e aplicar os filtros.
    def __search(params)
      # Formata-os parâmetros e utiliza a biblioteca Ransack para criar a query no banco de dados.
      query = ransack(format_params(params))
      order_by = format_order(params[:order])
      current_page = params[:current_page].to_i.positive? ? params[:current_page].to_i : params[:page].to_i

      # Realização da requisição ao banco de dados, utilizando algumas opções:
      #   distinct: Retornar dados distintos.
      #   order: Definição de por qual atributo deve ser ordenado.
      #   page e per_page: Definição da paginação dos resultados.
      # Por fim tem como resultado os dados prontos e paginados.
      query.result.distinct(true).order(order_by).page(current_page).per(per_page(params))
    end
  end
end
