/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dto;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Duoc
 */
@Entity
@Table(name = "equipo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Equipo.findAll", query = "SELECT e FROM Equipo e")
    , @NamedQuery(name = "Equipo.findById", query = "SELECT e FROM Equipo e WHERE e.id = :id")
    , @NamedQuery(name = "Equipo.findByNombreEquipo", query = "SELECT e FROM Equipo e WHERE e.nombreEquipo = :nombreEquipo")
    , @NamedQuery(name = "Equipo.findByNumeroIntegrantes", query = "SELECT e FROM Equipo e WHERE e.numeroIntegrantes = :numeroIntegrantes")
    , @NamedQuery(name = "Equipo.findByVigente", query = "SELECT e FROM Equipo e WHERE e.vigente = :vigente")})
public class Equipo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_equipo")
    private String nombreEquipo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numero_integrantes")
    private int numeroIntegrantes;
    @Basic(optional = false)
    @NotNull
    @Column(name = "vigente")
    private boolean vigente;
    @JoinTable(name = "rompimiento", joinColumns = {
        @JoinColumn(name = "id_equipo", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "id_liga", referencedColumnName = "id")})
    @ManyToMany
    private List<TipoLiga> tipoLigaList;
    @JoinColumn(name = "tipo_liga", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TipoLiga tipoLiga;
    @JoinColumn(name = "clasificacion", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Clasificacion clasificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "equipo")
    private List<Usuario> usuarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "equipo")
    private List<Jugadores> jugadoresList;

    public Equipo() {
    }

    public Equipo(Integer id) {
        this.id = id;
    }

    public Equipo(Integer id, String nombreEquipo, int numeroIntegrantes, boolean vigente) {
        this.id = id;
        this.nombreEquipo = nombreEquipo;
        this.numeroIntegrantes = numeroIntegrantes;
        this.vigente = vigente;
    }
    
    public Equipo(Clasificacion clasificacion, TipoLiga tipoLiga, String nombreEquipo, int numeroIntegrantes, boolean vigente) {
        this.clasificacion = clasificacion;
        this.tipoLiga = tipoLiga;
        this.nombreEquipo = nombreEquipo;
        this.numeroIntegrantes = numeroIntegrantes;
        this.vigente = vigente;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public void setNombreEquipo(String nombreEquipo) {
        this.nombreEquipo = nombreEquipo;
    }

    public int getNumeroIntegrantes() {
        return numeroIntegrantes;
    }

    public void setNumeroIntegrantes(int numeroIntegrantes) {
        this.numeroIntegrantes = numeroIntegrantes;
    }

    public boolean getVigente() {
        return vigente;
    }

    public void setVigente(boolean vigente) {
        this.vigente = vigente;
    }

    @XmlTransient
    public List<TipoLiga> getTipoLigaList() {
        return tipoLigaList;
    }

    public void setTipoLigaList(List<TipoLiga> tipoLigaList) {
        this.tipoLigaList = tipoLigaList;
    }

    public TipoLiga getTipoLiga() {
        return tipoLiga;
    }

    public void setTipoLiga(TipoLiga tipoLiga) {
        this.tipoLiga = tipoLiga;
    }

    public Clasificacion getClasificacion() {
        return clasificacion;
    }

    public void setClasificacion(Clasificacion clasificacion) {
        this.clasificacion = clasificacion;
    }

    @XmlTransient
    public List<Usuario> getUsuarioList() {
        return usuarioList;
    }

    public void setUsuarioList(List<Usuario> usuarioList) {
        this.usuarioList = usuarioList;
    }

    @XmlTransient
    public List<Jugadores> getJugadoresList() {
        return jugadoresList;
    }

    public void setJugadoresList(List<Jugadores> jugadoresList) {
        this.jugadoresList = jugadoresList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Equipo)) {
            return false;
        }
        Equipo other = (Equipo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.Equipo[ id=" + id + " ]";
    }
    
}
