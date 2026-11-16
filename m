Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794819535;
	b=4ieE28uRVQ0fcup51FclBdRdzRb/6I5NUrFTVGRmVh3K8qZlMj8fEXYcC29g/1wtPeLX
	 wAznrnVRkCHMLp/oP5duZD5ULgB07DKxV2yCLgmCqrXpx7+M6UAD/kKl5EdLnL6ZFjIGX
	 O6TzNjfRRoQ5U/1hmURrAN1insusAQ1vp2sEoe4oB2g2ykAMOBX2zvfQrsQ9xV7oy7IaU
	 LiwrycJuVbu/0X6Hhn9kP+L7ybRjZwDX8FMB5vL1R9k/fPDZ6mN0alnE3+F/BU71OgFpC
	 3/Lk7emd7pi7VRyUOZuYy8HGAeS0OzcO4y5cRfQtbEuEt0o4O0yu0z4WYRNqYj3KJjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=G/Vr4BBywor03GrVAShmfnjvH170LKRsQquDNG51aqg=;
	b=nE2HrGegqj0ovx3j176YOKvKBcxsM4q/drQ+e8Kq7jw2rNe73euZx0yb+nfs3koVF7Oa
	 wewrnqgaonbGmE88ylzvnmdN51uKqJtB0FrchOSPScPaXRyRoYxxycfGTKa6tQmoLUi0e
	 jcdC2feCw/deRBXa0qW+ZIUMT5zK8NGl2M8UQ5sjZD0fec9+DDTiHBLjzyrbktp99UV7A
	 uHsDMl05+UZAXv53BxdL7bZHcnGj3tWCcFQyYv6VU8XjsEFrlzQQ7YDkm2SWRmjHKqxzd
	 Ow3qj+eJE65wXAhruGxaL1IlskU7WSXL1hfm9TvDqEcKZCh0KG44jcfJyg+QAYckVGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=acio.nl;
	spf=none smtp.mailfrom=acio.nl;
	dkim=pass header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YVJuK8BH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005CC606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005CC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=acio.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=acio.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YVJuK8BH
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so465373466b.2
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 00:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794819533; cv=none;
        d=google.com; s=arc-20260327;
        b=maWnLUATCWZskGC4RIjYn+CrSbbM/oAbyThf30H8eCnBhHOsdc5BEbCpQc85kv3gn8
         fRLv6qzwMItvogZlqc8dMZSJmb1U0UyUmDfi0zTxIS2fTunMYs/jar/2A6OgSrtbExxd
         Yk3Gx3aPjuzgsM3Mau+CrmDFe53jUKdp5piUiWP8mkmHV3zPE6Wc1LTG9Za7eIxLECuw
         IZ+xL7b8hGzJx/j25PTuqDqy8yGjXBPquoqsn1I+LGfYPN7NBhKapSsaBUzgT7R42c8d
         daJFfReGXyeLsuXuVUV8f5mWYTaw0FNmsBUYKYDAZoIh3/eqjSXyq+nBshWCR8AVPJrj
         1f1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G/Vr4BBywor03GrVAShmfnjvH170LKRsQquDNG51aqg=;
        fh=zFCB9yj6tbPtiNOgT9n/qK9LnQKfgtX1AWhCxXtoerY=;
        b=GJPgh57B25q4AEZIWCF6QoMdLRN0wPApf3xBemnVcFV2XVH+/UnDPadeI2bhX9kmCz
         bz+XQEkwgAY10WS35JFR8XT3R9HYJAhRgJmedSPZwvg0HJBOHraqZKGa/wOXsbpMMqJp
         ovJKhlqzKv9eV2w1aBAX35IfMlSUmeDPUD3tZM1OuX1qsJxjvXZudtpdS+bB3yk6y8wL
         Q2RhUqoUdMUo5mIoWEDPmdWDYzbHY5l1kWcUe0wrJKvAm3xyKcyy8+4WmSV9Pakh8orK
         TytTwjYGz9K8qwNHfwcqTJDjqz+pdnuV9Sj9LlRN9sXm3hFJ98je/btpUeOXiT4ljKvk
         Oaxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=acio-nl.20260707.gappssmtp.com; s=20260707; t=1794819533; x=1795424333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G/Vr4BBywor03GrVAShmfnjvH170LKRsQquDNG51aqg=;
        b=YVJuK8BH7LfaoIyYYZ8X/pqzUkM9e8tEvN1YQFDEeVWhqcInOKEabJDs61RWL0zikn
         ABPHNlTXl1gTBzAcR2AvJJXpNaEGygFZ9I6O9qzlwlMBeFKy7ZNrtnbty3Z9C5IVFOoy
         Rb9ksoI0ZRv1dt58qihmVRd3r4jDkMYLslnGki0uIlskFmUXuwp6yRAs+GS96WVyGFsp
         PzbLirDSebOgiItTIkK1ICVt+t1pGZpm83YtaY9uG9GzZOLOedQxmSWY2HFU/Ht8P/Tv
         eVYt0y6ZerSdJlV/9HsWyFaxZCYtbQn8tQu2BjNWZ4Nv02BHGoMXNCqAi89zvixLEwm1
         9TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819533; x=1795424333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/Vr4BBywor03GrVAShmfnjvH170LKRsQquDNG51aqg=;
        b=AWFbfpeEDFLsNyC16OQkIxkOX9H//nVZHSsht3FFGcMGrFuv8VLM8xoEJ73gLQaVjD
         BHoPLP1Elm8AzuGHGtEUN5qWBCYTIhc9zqhBbqEUUaC3WKTe31+WUYbHEqvi6xLfvMsP
         UQJ1M9p7a/HedNuknl7EHs8TYMrsX4l3qqYhPZuaICvU+L1pnP2PsmTR1OzOF3ZKMP1H
         xCGCiOahOuXOlNHjzkkInlW/xWDx6czbRratInO/3f0d88ga7+kbAfKStanPO7P2ivD6
         i2wXrjIDZWmH2Y8HIPaGr7NIcl3nw61StyJ26b9LLjfXecvelZSkrfKGa+rJsSFr87Bh
         gw9w==
X-Gm-Message-State: APuU4Z8HidY9Z+Beg0H45lQ2g/ghfSRYgJmVg+saQE/q1KIQ98W9QhpV
	sg83bs2irFKHeXt6ySF7hhZV4aH9loDixT1KEVBkJRxE7UIX/Evpb0rJ9b1Xuz/DJyMhgHuUhpk
	WSQSAWxDTSL9HjKUWP50qM5I/jKLbe8LWA3eH/NMX
X-Gm-Gg: AYBFou0gniTeACGvQuyJ9cYtH174Ia5ctCG9FLlDKXHMtbw9VNiElFGZCZ2Y6tEG0dA
	j9+JaYafKoFxxjuVs6A6y3kLF7jQFYMZ8852ucgaQIhNGL96s4g9nH/KVIkKC6DJmPFMVLKwkoZ
	NUGTbZIjMwpTHKGxiv17iApVpY+3oyoBHOTG8yC70QRk+7UDbvziA0/p+vJXoUI4UFzbxE4dmxE
	t6QKZIWYtMOpMt3mNFF1VpTEuYFS16eqOl8XjTefI3dh7/SVwXzqcS5LUZDg3bhTSwrp/EOwLfl
	j4zNYb8EztKKPjaiNHbmjFAAU9bHwMIS6ISg80cudf7vdFj8y1R18NRhT7aBUjT0gdqBKFWoRix
	3Bx5JnjcpWsQp+AGNqrEs5u9NTyNPQJRWLuHo65Rt+X+3ggATkTPuxHvZcb05
X-Received: by 2002:a17:907:3f1f:b0:c31:c767:adfb with SMTP id
 a640c23a62f3a-c5095dd6c2fmr789969666b.0.1794819533344; Mon, 16 Nov 2026
 00:58:53 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116081741.51039-1-spam@acio.nl> <affec3fd16f6419d8072f5dfba3b31ba@realtek.com>
In-Reply-To: <affec3fd16f6419d8072f5dfba3b31ba@realtek.com>
From: "V. S." <spam@acio.nl>
Date: Mon, 16 Nov 2026 09:58:42 +0100
X-Gm-Features: AclHuK9JRPa3ShvG4T19UiV21r_EBc01Cgq4ULgxDCO6CsPzyZDZFxggn-kfMog
Message-ID: <CAJKtVVaL-VV+m18OOzr3vEOO0nuzuzw-bhL9SaHFcUh=+3nzwg@mail.gmail.com>
Subject: Re: [PATCH rtw-next v4] wifi: rtw89: set RA init rate level when the
 station RSSI is known
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping-Ke Shih <pkshih@realtek.com> wrote:
> Vincent Schurink <spam@acio.nl> wrote:
>
> To be more conservative, I'd only update ra->init_rate_lv when ra->rssi_u=
nknown
> flagged, since I don't thoroughly know how firmware deal with the value.
>
> Let's get and check local variable, and then assign to ra->init_rate_lv.

I updated v4 to use conservative updates.
I submitted v5 with the changes;
https://lore.kernel.org/linux-wireless/20261116085534.66746-1-spam@acio.nl/

regards
Vincent Schurink
On Mon, Nov 16, 2026 at 9:33=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
>
> Vincent Schurink <spam@acio.nl> wrote:
> > @@ -519,6 +533,11 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev=
 *rtwdev,
> >
> >         rcu_read_unlock();
> >
> > +       ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link)=
;
> > +       if (ra->rssi_unknown && ra->init_rate_lv) {
> > +               ra->upd_all =3D 1;
> > +               ra->rssi_unknown =3D false;
> > +       }
>
> To be more conservative, I'd only update ra->init_rate_lv when ra->rssi_u=
nknown
> flagged, since I don't thoroughly know how firmware deal with the value.
>
> Let's get and check local variable, and then assign to ra->init_rate_lv.
>
> >         if (changed & IEEE80211_RC_SUPP_RATES_CHANGED)
> >                 ra->upd_mask =3D 1;
> >         if (changed & (IEEE80211_RC_BW_CHANGED | IEEE80211_RC_NSS_CHANG=
ED))
>
>
>
