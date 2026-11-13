Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794584086;
	b=f1s5P8HrMpkXhf/f0vwenmKNkhUppcPAI6IYqv2kv8WlaYIiMxxgsg7dTJSULBK67LDF
	 x2IUzE18nE+nJRb+j/75dsTILoPciC06cFRBPexIYonYz5IL9eoAfuKEaue/OtjD5Lq/N
	 TxkvoTg18MfcKU78GpWgAfUImvGDVnoY3ls5e0WTJ/veql0Ezl5Jly25rqDp55R3S1QBg
	 1OuwdJay3Um+2zBwCITElq9ZdL83qExu/GZQLX5aaD1D6B8xEBHkVxmlLqIUv+k/OQyJQ
	 lxr04vDO9q5JrHJvV5aBwOiVJ9IhosMzDAMrgBV2VqhGTd3fcHXFJ6mknk5DYhG9n7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jwrlUJPKdABx5QTH0PQtOE2va6y3nW2738NJUmIJqwg=;
	b=GwwGqDMys66Am2JeQywXJTBA+nc73QIzTudiHx/M1nc7eCvDzuU8K0TUNLrXmRUtoG8n
	 ZVoxgJsYjhBAyjuoOJC9JPln4krRuhdg083nuDAxGPbqiYI0R9er7xc2Q8nOybtlydKBa
	 /vluO4Ew+XfPa2ILbE2zzAbaOxBXQlZILIXxSVBtrtvKbXHBuEqJA6+i0mtgcjqz4GJOC
	 QHZcpXK6RxMnpu06LCn1KcCNFyB/F/Yu/gcu8Wi61aOA3ypO6ddEsooXHnJlx8CGktS15
	 2t2TaDX30jfwSczQ/a5T70IHRzlT0pg14gyWus0i5DVU6/3mrL+Q8yvPoC/LLmleRXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=acio.nl;
	spf=none smtp.mailfrom=acio.nl;
	dkim=pass header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lJehH9+a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D592606A32E
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D592606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=acio.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=acio.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lJehH9+a
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so206487766b.2
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 07:34:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794584083; cv=none;
        d=google.com; s=arc-20260327;
        b=O1J1iFJbeYkhFznYS+mTkKbKu8EQihBMFfBx+KeE5l2E/Jg9dKDOR8FZlPWRFrxpRP
         v9K+sD/2NKX8/xrbh+/WlsAMYvT9vMP6LVjgnesFCXxtKDfB1d+kh8OlMXtZoOJwHczT
         0fRYe4KWhlgSjM25/JCu3WAhqLfMeULWmJGtEOD8UIRc6uJ9R2pRRv/IYYPjJafFGXLg
         Rf4wIWUbKkwH0Z2c468mb4gdSWb1PIJYNDz0XCGX/ZdMTDHyUH22v5xo2LzViMWEo4w8
         +NcgzcxvbVmQ9GXnczAnYxAKG2vD3qfKDj23qAmos8zLaaXAi4K03O4wkB+O2OdF4SAb
         evWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jwrlUJPKdABx5QTH0PQtOE2va6y3nW2738NJUmIJqwg=;
        fh=zFCB9yj6tbPtiNOgT9n/qK9LnQKfgtX1AWhCxXtoerY=;
        b=fXvw8cz2SaRsHItfxqcvsvRzwYEHJSFszhynJPElm3WnE828PALM5rUepqsj8JDggU
         K7ZTxMp7w2x7OSKDb47bRSBeQ7ZM7tiUHoASZEz0mnZhgxHmEStx0367Um1zbRrO2+Zf
         P+wkPIATfK51Q8iyxu9clGAjWuR7s9EFRgTJlCxQCDTEIWbSr4MRCakMa0sxR1ME+uzC
         d5hDJuZpDuS1PwrTH07n0SQu35CenYnBVLybjm2GfgOCqNqO3WovzsPaSm9ObWLdMaZN
         Z0PZL6XzbNe2A1wsWFMhUEUtM8oLG+kbfxPkXbM5BqoIJ2MEAIHQOYsx0DA/63iR0sWQ
         xYXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=acio-nl.20260707.gappssmtp.com; s=20260707; t=1794584083; x=1795188883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jwrlUJPKdABx5QTH0PQtOE2va6y3nW2738NJUmIJqwg=;
        b=lJehH9+aYjooq1lKqyPQ0etA2/AfKyiU9u6DFC5p4NGTVn2rJ8fWWtHvMotDs/d7Lr
         O78ojSqsr+o68m6JHGkLM0ihami5nxIJb5hj9GT4dd7K9ZKe3AklgkSUS5hpH+r1aBv1
         tlf/5cN5BpRkNn8B5tw9jhk/Rk4UjY51yTe1zl49CmKjPrrpTSY4pMLRSTg2nXrwVEdv
         /l4Bqtd3WGQT+B0IX/p1ujcS2sBH75dgOpyh3NS0AFUYu0tHGbqAgpK4VJqwpbpRMbEs
         oH5+T+KcfnQTOBgso61ViygYSz2T3gJPWDX4WFdKmYMiL3bqBvfS1SndYuk0xd+oe+Bd
         A5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584083; x=1795188883;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwrlUJPKdABx5QTH0PQtOE2va6y3nW2738NJUmIJqwg=;
        b=ljtaz3pqRL1tkpD3X5DrQabyzhsK0vvwsPEVJxLRl4/fNcHHQnLOmTbiqmxW1RiD1O
         RQwGYkiHyUycGxpFTWUU7jjz2mFQ6GxogPywJ//nMFzihc977ZyDh6jk1U00uRcUWSPN
         ojliv7moWgUq4PY4zq4o8F5G+046HTiONeE5dFgvEU8yU4dnasgGjvo1TvEaSt/TypLo
         bQ/y/83lmMIHGGzNN++uTMqrIqQhtPPRqLy1076pYGGRrJzqmC7uBLnEKc5heLIp9JEc
         IzHVDnp1NwrIx349L72dBtMb8qWC/u5s5KzB+0cF4a6R+VIe+9L/7V2KkriobqM1p1DF
         e4WQ==
X-Gm-Message-State: APuU4Z8f6ZDdcZ+J7OF+FkxhpAzBKmTWWUZpDWKiMr+nlJJCNGNrZOHT
	YqW/P1LXq8qDUHjTnnh1nbd3vxhMIbLzo81EtC8DWv1Oc4IqKcj3kICENEHNJTQg7LRVvnFNVeO
	HUzklBKECl73kRDgPqc7yN74X09cWAVyg5IcnLRUDwZOoSyvpNugpUWXA
X-Gm-Gg: AYBFou3BKlHQhKSd1r46G/303D1Zw8n56bLbiOS76piJjZj94SHMayGLk097qkv3+OR
	LtyqGx2UPNVZ4WsrHRQKI48sCVN8VEvDau/Ef6Yp95KnlHruLYEPZmBcKGuu/xrHKM3cvxbxvXh
	JU37XAI9kFxPFWi4iN4P2r1rdOOjhMu+If1pxof20njuxjh+rCzoOe+J+cfFyfnyGkR50SbIUXN
	f9sUrVHkseGDUqcASaHbdw+nC0WbKwSoa+Ha0hPY6bBJbbi9AuV4wJktVcu31u+MkxPC2yLpqfF
	53cVS+snoVvouSKaSeiKHM+EZWdCMTGZgzcbC8MyDL3uqF9/PK0+YzJ4GS6f1tGsLZxTH/hRm/R
	MmpxvBAbhSyvOEGnADU7nV3e+udLkSKs+q80UwnO9hzT+7dRpL0egTdyS+qkr7AwZZZv4f8Q=
X-Received: by 2002:a17:907:72cf:b0:c41:e75e:5889 with SMTP id
 a640c23a62f3a-c5096398b58mr251813566b.33.1794584083139; Fri, 13 Nov 2026
 07:34:43 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113080731.30155-1-spam@acio.nl> <4985719de8b5439e8484384ed52033e1@realtek.com>
In-Reply-To: <4985719de8b5439e8484384ed52033e1@realtek.com>
From: "V. S." <spam@acio.nl>
Date: Fri, 13 Nov 2026 16:34:32 +0100
X-Gm-Features: AclHuK_fJT4q2TJ56RTo_qXiWrIJ7wwaBWroGnBejNWlwJo_mMjtDDlCpc8LiFA
Message-ID: <CAJKtVVYmwL3FOC473sQ4BMPjmhep-ERiu=YtmpOQ+24qXB-VMA@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping-Ke Shih <pkshih@realtek.com> wrote:
> Not only RSSI 0 but RSSI 1 can fall into this case, but I think it is har=
mless.

Agreed.

> How about put into ra-> instead of rtwsta_link-> ?
>
> Please put it on bottom with a comment like below, because the struct rtw=
89_ra_info
> is a copy of H2C command (at initial version).

OK. One point before I send v4: rtw89_phy_ra_sta_update() starts with
memset(ra, 0, sizeof(*ra)). The RA update calls it every 2 seconds, so
the memset clears the flag before the RA update can read it. Thus, the
RA update must keep the flag in a local variable before the call. This
is my proposal for v4:

--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ struct rtw89_ra_info {
  u8 macid_msb:2;
  u8 band:2; /* enum rtw89_band */
  u8 is_new_dbgreg:1;
+ /* driver helpers */
+ bool rssi_unknown:1;
 };

--- a/drivers/net/wireless/realtek/rtw89/phy.c
+++ b/drivers/net/wireless/realtek/rtw89/phy.c
@@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
  struct rtw89_ra_info *ra =3D &rtwsta_link->ra;
+ bool rssi_unknown =3D ra->rssi_unknown;
  struct ieee80211_link_sta *link_sta;
@@
  rcu_read_unlock();

+ ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
+ if (rssi_unknown && ra->init_rate_lv)
+ ra->upd_all =3D 1;
+ else
+ ra->rssi_unknown =3D rssi_unknown;
  if (changed & IEEE80211_RC_SUPP_RATES_CHANGED)
  ra->upd_mask =3D 1;
@@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, struct
rtw89_sta_link *rtwsta_link)
  ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
+ ra->rssi_unknown =3D !ra->init_rate_lv;
  ra->upd_all =3D 1;

Another option is to keep the flag in struct rtw89_sta_link, as in v3.
Then the memset does not clear it, and the RA update does not need the
local variable. Which one do you prefer? I will test the change on
RTL8912AU before I send v4.

On Fri, Nov 13, 2026 at 9:24=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
>
> Vincent Schurink <spam@acio.nl> wrote:
>
> [...]
>
> > @@ -747,14 +765,8 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, =
struct rtw89_sta_link *rtwsta_
> >
> >         rcu_read_unlock();
> >
> > -       if (rssi > 40)
> > -               ra->init_rate_lv =3D 1;
> > -       else if (rssi > 20)
> > -               ra->init_rate_lv =3D 2;
> > -       else if (rssi > 1)
> > -               ra->init_rate_lv =3D 3;
> > -       else
> > -               ra->init_rate_lv =3D 0;
> > +       ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link)=
;
> > +       rtwsta_link->ra_rssi_unknown =3D !ra->init_rate_lv;
>
> Not only RSSI 0 but RSSI 1 can fall into this case, but I think it is har=
mless.
>
> How about put into ra-> instead of rtwsta_link-> ?
>
> Please put it on bottom with a comment like below, because the struct rtw=
89_ra_info
> is a copy of H2C command (at initial version).
>
> @@ -5235,6 +5235,8 @@ struct rtw89_ra_info {
>         u8 macid_msb:2;
>         u8 band:2; /* enum rtw89_band */
>         u8 is_new_dbgreg:1;
> +       /* driver helpers */
> +       bool rssi_unknown:1;
>  };
>
>
> >         ra->upd_all =3D 1;
> >         rtw89_debug(rtwdev, RTW89_DBG_RA,
> >                     "ra assoc: macid =3D %d, mode =3D %d, bw =3D %d, ns=
s =3D %d, lv =3D %d",
> > --
> > 2.53.0
>
