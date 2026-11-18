Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991963;
	b=Kc+VOTndZSNqhnUUdu7Min2S/DH64YQEApQI/91wXKdXe+ZpwA0+ETvQYSq9iWDo5jKG
	 pSHRfD/bhjvTzj2J049BJGueKSmtekkvmiCNfaWB13h8TMibKsrv88Ndwgm8B129IVhg+
	 LMk8V/EudGgLjd4H8FYkvJajAApISsCzzvolLe7VOaeQZCj2iJms6opmihV8Dimnq6+xZ
	 mFyFmk633IIHB0EUulEptX2HCvnx6OZ/Uma69IylwbZ6tBhQHUFKkCqi8i9jJE54lHfGJ
	 fBzLWm+YOml70TkFsVLvKh+FaWo95Vl5U53UlJr0w9j5Mhwd24D5veiFRHvj37fppgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991963;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TSnTnuwn1RAoBbrNUdP7SMb6q45VlFMT4RkSqCYRKK8=;
	b=TLyLe/ccB+CTVT5RlcKF8Mq89mU2/VVxoy0kxEPhfeetDG4mLZKZK+o5IbvFzIljUMGR
	 4cqKPtnZ/JJ+GY9CTa+/3CUJpaNOhP1LOCXwYFkGgCyd0TLQR2ScnGmyE/g6nyD2Zu6CH
	 R1gcvDvLonvdaKeQlkzou3fEQDNYiDQesjLO5spgsnpe+d2oHJGStawdvA15TF0Tz0dg0
	 gMb6BfPG96c1ka3NGbvF0etHnvZD7Zzrd38fn4nu7okPvwckbBjxgo2ywdnLntsL4+tw/
	 YuqYr5aq5LmBvdFVbi4DL9fIjzJczAEf2w6q1V05LgtzwWuw9AsROcs9SrLJKpgHecQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YrKrv9Bb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59442606A32F
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YrKrv9Bb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AE51F000C6;
	Wed, 18 Nov 2026 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991963;
	bh=TSnTnuwn1RAoBbrNUdP7SMb6q45VlFMT4RkSqCYRKK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YrKrv9BbR1DxaS8zPgEFFk1dtDkot76sZeLCpdWkajLSWtp6nk9DWRC+RPhQGgP75
	 +gAVQdyBHiNP4gtLfBW4Ra0ECPaDneMByMzj8pCwr19I3BAGyWvGkk0XTWI8sFrKOF
	 PVBXWoV2NGmBdAKffiV8/e+Eur25reCxFqMKq0BXr7EXUzLd+yRIHhPk2Vh5zIa/S5
	 /yRps26XdnHJGZxeb020X/VGlv/pl7MK96fXA943HvmK5J3iCrqBUg2aRrutMf9zTK
	 u5Amwh8L+pYuarepAXKUvSB7dzoz1p3nwz1DTveMR4fpcXJp4Zcy6KLqLuvO26zB9j
	 ZPeqzVg6kYtJA==
Date: Wed, 18 Nov 2026 09:52:40 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 15/19] wifi: mt76: guard the tx_list of every
 phy with one lock
Message-ID: <av1nWCZcshfm6Vg2@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-15-nbd@nbd.name>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wrPsXERUNeyZs3qf"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-15-nbd@nbd.name>

--wrPsXERUNeyZs3qf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt76_tx() lists a wcid on the tx_list of the phy its caller passes,
> under the tx_lock of that phy, while mt76_wcid_cleanup() unlists it
> under the tx_lock of wcid->phy_idx. mt7996_tx() and
> mt76_offchannel_send_nullfunc() can list a wcid on the phy of another
> link, so no common lock guards its node, and the tx_list gets corrupted.
>=20
> Guard the tx_list of every phy with one lock per device.
>=20
> Fixes: ce35ecffc96e ("wifi: mt76: mt7996: fix MLD ID in MAC TXD and HIF T=
XP")
> Fixes: 381733b3a14a ("wifi: mt76: send nullfunc PS frames on offchannel t=
ransitions")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mac80211.c |  7 +++----
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  3 ++-
>  drivers/net/wireless/mediatek/mt76/tx.c       | 13 +++++++------
>  3 files changed, 12 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/=
wireless/mediatek/mt76/mac80211.c
> index 6b496dfda5cc..da1da160909a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -431,7 +431,6 @@ mt76_phy_init(struct mt76_phy *phy, struct ieee80211_=
hw *hw)
>  	int i;
> =20
>  	INIT_LIST_HEAD(&phy->tx_list);
> -	spin_lock_init(&phy->tx_lock);
>  	for (i =3D 0; i < ARRAY_SIZE(phy->rx_amsdu); i++)
>  		spin_lock_init(&phy->rx_amsdu[i].lock);
>  	INIT_DELAYED_WORK(&phy->roc_work, mt76_roc_complete_work);
> @@ -753,6 +752,7 @@ mt76_alloc_device(struct device *pdev, unsigned int s=
ize,
>  	spin_lock_init(&dev->cc_lock);
>  	spin_lock_init(&dev->status_lock);
>  	spin_lock_init(&dev->wed_lock);
> +	spin_lock_init(&dev->tx_lock);
>  	mutex_init(&dev->mutex);
>  	init_waitqueue_head(&dev->tx_wait);
> =20
> @@ -1837,7 +1837,6 @@ EXPORT_SYMBOL_GPL(mt76_wcid_init);
> =20
>  void mt76_wcid_cleanup(struct mt76_dev *dev, struct mt76_wcid *wcid)
>  {
> -	struct mt76_phy *phy =3D mt76_dev_phy(dev, wcid->phy_idx);
>  	struct ieee80211_hw *hw;
>  	struct sk_buff_head list;
>  	struct sk_buff *skb;
> @@ -1859,7 +1858,7 @@ void mt76_wcid_cleanup(struct mt76_dev *dev, struct=
 mt76_wcid *wcid)
>  		list_del_init(&wcid->poll_list);
>  	spin_unlock_bh(&dev->sta_poll_lock);
> =20
> -	spin_lock_bh(&phy->tx_lock);
> +	spin_lock_bh(&dev->tx_lock);
> =20
>  	if (!list_empty(&wcid->tx_list))
>  		list_del_init(&wcid->tx_list);
> @@ -1872,7 +1871,7 @@ void mt76_wcid_cleanup(struct mt76_dev *dev, struct=
 mt76_wcid *wcid)
>  	skb_queue_splice_tail_init(&wcid->tx_offchannel, &list);
>  	spin_unlock(&wcid->tx_offchannel.lock);
> =20
> -	spin_unlock_bh(&phy->tx_lock);
> +	spin_unlock_bh(&dev->tx_lock);
> =20
>  	while ((skb =3D __skb_dequeue(&list)) !=3D NULL) {
>  		hw =3D mt76_tx_status_get_hw(dev, skb);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 7a2a6afc3c21..77bfecb7d49b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -872,7 +872,6 @@ struct mt76_phy {
>  	unsigned int num_sta;
>  	u8 band_idx;
> =20
> -	spinlock_t tx_lock;
>  	struct list_head tx_list;
>  	struct mt76_queue *q_tx[__MT_TXQ_MAX];
> =20
> @@ -988,6 +987,8 @@ struct mt76_dev {
> =20
>  	struct mt76_worker tx_worker;
>  	struct napi_struct tx_napi;
> +	/* protects the tx_list of every phy */
> +	spinlock_t tx_lock;
> =20
>  	spinlock_t token_lock;
>  	struct idr token;
> diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wirele=
ss/mediatek/mt76/tx.c
> index 0085b7a29fce..9eafc86ec288 100644
> --- a/drivers/net/wireless/mediatek/mt76/tx.c
> +++ b/drivers/net/wireless/mediatek/mt76/tx.c
> @@ -392,10 +392,10 @@ mt76_tx(struct mt76_phy *phy, struct ieee80211_sta =
*sta,
>  	__skb_queue_tail(head, skb);
>  	spin_unlock_bh(&head->lock);
> =20
> -	spin_lock_bh(&phy->tx_lock);
> +	spin_lock_bh(&phy->dev->tx_lock);
>  	if (list_empty(&wcid->tx_list))
>  		list_add_tail(&wcid->tx_list, &phy->tx_list);
> -	spin_unlock_bh(&phy->tx_lock);
> +	spin_unlock_bh(&phy->dev->tx_lock);
> =20
>  	mt76_worker_schedule(&phy->dev->tx_worker);
>  }
> @@ -740,6 +740,7 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, =
struct mt76_wcid *wcid,
> =20
>  void mt76_txq_schedule_pending(struct mt76_phy *phy)
>  {
> +	struct mt76_dev *dev =3D phy->dev;
>  	LIST_HEAD(tx_list);
>  	int ret =3D 0;
> =20
> @@ -749,7 +750,7 @@ void mt76_txq_schedule_pending(struct mt76_phy *phy)
>  	local_bh_disable();
>  	rcu_read_lock();
> =20
> -	spin_lock(&phy->tx_lock);
> +	spin_lock(&dev->tx_lock);
>  	list_splice_init(&phy->tx_list, &tx_list);
>  	while (!list_empty(&tx_list)) {
>  		struct mt76_wcid *wcid;
> @@ -757,19 +758,19 @@ void mt76_txq_schedule_pending(struct mt76_phy *phy)
>  		wcid =3D list_first_entry(&tx_list, struct mt76_wcid, tx_list);
>  		list_del_init(&wcid->tx_list);
> =20
> -		spin_unlock(&phy->tx_lock);
> +		spin_unlock(&dev->tx_lock);
>  		if (ret >=3D 0)
>  			ret =3D mt76_txq_schedule_pending_wcid(phy, wcid, &wcid->tx_offchanne=
l);
>  		if (ret >=3D 0 && !phy->offchannel)
>  			ret =3D mt76_txq_schedule_pending_wcid(phy, wcid, &wcid->tx_pending);
> -		spin_lock(&phy->tx_lock);
> +		spin_lock(&dev->tx_lock);
> =20
>  		if ((!skb_queue_empty(&wcid->tx_pending) ||
>  		     !skb_queue_empty(&wcid->tx_offchannel)) &&
>  		    list_empty(&wcid->tx_list))
>  			list_add_tail(&wcid->tx_list, &phy->tx_list);
>  	}
> -	spin_unlock(&phy->tx_lock);
> +	spin_unlock(&dev->tx_lock);
> =20
>  	rcu_read_unlock();
>  	local_bh_enable();
> --=20
> 2.47.3
>=20
>=20

--wrPsXERUNeyZs3qf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1nWAAKCRA6cBh0uS2t
rGE+AP9sCuwEDZq+5DIelmxwlduPz6GtSBEh1v+io98gozeKvQD9EkM7E1AWRPFr
YaIghULHRGE1i3qY/rDuS0TiGVpU3Qo=
=9Axp
-----END PGP SIGNATURE-----

--wrPsXERUNeyZs3qf--
