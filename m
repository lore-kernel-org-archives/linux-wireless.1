Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231634;
	b=azrF4Ra+pzfTWuPS3WrHh9zwZaeJ0iOCHkcr7C8ufvgAiGD4lxL+ZaZeYTRJSMHRW/LA
	 FbgBmp6l6JTIjF0G3nIkgmjni8byEB9Xhcl30dn1sqzydyohjdYNk+M7YJ2F/+sE5z13p
	 btWQt8IhcAWbke61QQ7IWfhoLlDuU49z+IzTJVz8d4chn6T7bESPig014WQhtrE+7c8Bc
	 zJbnm5TaPocTYpF34RBJvgRLe9GU9B2+0eTd4VzLhCni8R6UUWKCF7+3aQrkttTIA1Pys
	 /S7VIGhI7a/+9BRaiovxd4+k8jihyNUUn3dOfOjiWhGvlffekc/IYRz4fMqO4o2zw+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231634;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-malware-bazaar;
	bh=A8d8Mmn4kRJYLi22ow0sFoZPgwOwfibTq6Yi6fsgcV4=;
	b=xKJ4yVjkjiPnYFq5K395zL8fnHyhc+ZGablFQnThyd5kLgoT81Tu4kNSFfIH0IkqsTn6
	 emyiTiSe2cMPpJ4QyzoW22OyZ0SLLTNZIy+oI1R5OHzkHdvffauybaBOcdOQGwz5zxJAM
	 v0Y6wIx1l+4Bz9iZeZZQyfLgvn5T0vNzSg32/yZ8HUIgIMANEbweBGIWOIIdxhbP9qz3G
	 fYiPcpZyte2+3Z9sAOPSV/WMGDuqRpnPlrSwkCEEAVjcxxXseW7MtdSMHuNYrdJCrqtAv
	 dbfhJO3aBqOo0NFr9mzhkxrJfp2zriHbUdFcQiQxBf/8+KeldvxoZ+6DtUpQGQf5qfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=qcoqjtIk;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC71F606A321
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=qcoqjtIk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=A8d8Mmn4kRJYLi22ow0sFoZPgwOwfibTq6Yi6fsgcV4=;
	t=1794231632; x=1795441232; b=qcoqjtIkryoVsZP8Av8OXOnEdM4B9tMghgkn1rySn6QViuJ
	KwxaGmkU67PT3RqAOk2d7ExaS8SOBDbGWc6/Kisig1P8MOzDNDdwSo6/6NqZLka0pByst0TLXkhrn
	YhSg4MduzQ+ID5kUNiniutY5x0S0GLK51kAT/S/NSuHP8g/3QlM5wKvgU6Lq0m71K1ZRxZXbXj5Qw
	pRIHTjCOwwb8MjYly4+jl2HtKRMmskGFc7t4UcGUUWQXhL4jzepwGHDaeW93cjH/XwtiE3EN4FgD4
	8sq9rJZPewTXQcp5rs+3dhf9iJXopgK1Wa0pvqKQgxPHy9xLKEImXdypc9J4/lrg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQPbk-0000000H0Rm-1zh7;
	Mon, 09 Nov 2026 14:40:24 +0100
Message-ID: <d22cd7e1a4226cc0753f651793040a125c44fe44.camel@sipsolutions.net>
Subject: Re: [PATCH 13/30] wifi: mac80211: don't apply CoDel to PS-buffered
 frames
From: Johannes Berg <johannes@sipsolutions.net>
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, 
	linux-wireless@vger.kernel.org
Date: Mon, 09 Nov 2026 14:40:23 +0100
In-Reply-To: <87cxsip2st.fsf@toke.dk>
References: <20261102203831.1058362-32-johannes@sipsolutions.net>
	 <20261102203831.1058362-45-johannes@sipsolutions.net>
	 <87cxsip2st.fsf@toke.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Fri, 2026-11-06 at 13:22 +0100, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>=20
> >  	unsigned long flags;
> > +	codel_time_t ps_backlog_end;
> > =20
> >  	/* keep last! */
> >  	struct ieee80211_txq txq;
> > @@ -2724,6 +2729,8 @@ void ieee80211_txq_init(struct ieee80211_sub_if_d=
ata *sdata,
> >  			struct txq_info *txq, int tid);
> >  struct sk_buff *ieee80211_tx_dequeue_ps_release(struct ieee80211_local=
 *local,
> >  						struct txq_info *txqi);
> > +void ieee80211_txq_ps_backlog_start(struct ieee80211_local *local,
> > +				    struct txq_info *txqi);
>=20
> The variable above is called ps_backlog_end, the function is called
> ps_backlog_start. Seems a tad confusing? :)

Yeah ... I can explain that, they're two sides of the same coin:
_start() says "the backlog starts processing now, the station just woke
up" while the "ps_backlog_end" is a "this is the end of the queue
backlog" marker (expressed in time)...

Basically "start" is the verb, and "end" is the noun, but yeah I can see
how that's confusing. I think I'll try to just find completely different
names to avoid that start/end correlation.

> > +void ieee80211_txq_ps_backlog_start(struct ieee80211_local *local,
> > +				    struct txq_info *txqi)
> > +{
> > +	spin_lock_bh(&local->fq.lock);
> > +	if (txqi->tin.backlog_packets) {
> > +		txqi->ps_backlog_end =3D codel_get_time();
> > +		set_bit(IEEE80211_TXQ_PS_BACKLOG, &txqi->flags);
>=20
> We should probably clear the codel variables here as well? Otherwise, if
> CoDel was already in a dropping state when this happens, that can carry
> over to after the bypass ends.
>=20

Makes sense, I'll take a look.

johannes
