Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863250;
	b=TCheWPewoxUyvGCAEA7OPMWr7t4aMQSZO4v34sqNFWQ1hnXQAP/X0+5sEpNFA56bgtC3
	 oOCujIn0CywpP1RM923ZHAmKYL9am7rTDez86f5IbT83zTXHP5D7M4zqzWvC+nMme7vwX
	 5fCXtXAO/eEvZbKm11wQCcr5ZBFUEFbXy76HW8Bc/gmT7NwaWqL0pSwqPxuikBXjB5vGt
	 Fqj6riilezRtkqKkVfQrujzJAjk8AyLAT03SCoVEX016PrWitXkTwZgxl56uGR9j48rn2
	 M+NEvijy8uf4jAJtBEZ3O03ddj4+/or278srzPy1L+fuNZaxM9jgypdP1QgzKO4Adgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863250;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=kZJI92WSfPAdotPDRuAUvGN+lTnidbW9hfZq2rnUQB4=;
	b=w6Zl82qfqyNCcskn8oIB5Xzlo1Tqnwv9YzUr1qNQ4Z4Zuf8cdSX9e/HIPtTtYSiLmmCM
	 F2YXpRg8lGoysiw6k1KE4ue/nEKj97VBgijgl+lZtLLIu2bBqIm3WJE6LmNOXdeM6O9YO
	 fDlCQPwegLBqvqWvkRCi9AEQ/sR9yAE11W4brIRUxWzAjvJguOD7Wm2q8NA+MLx8m4tHq
	 pENPSVTqT8jYhv9QViQjSVjMbD5t8M9izWYMVohlEinwl9f8SPo4Uyze5ynE6bf4lvzHT
	 6xxr8Y8LZmX/CZNJKbue5PMnIO1qFTP6ADzplmND8JMUo+pMsZSLKBemTSUT9j14/7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=feuoK0r4;
	arc=none smtp.remote-ip=91.218.175.43
Received: from mta0.migadu.com (out-43.mta0.migadu.com [91.218.175.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77284606A321
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 10:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77284606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=feuoK0r4
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=iWwi2lH1Uju0BaXSu2zavvIXtR7UQypN1YDZdfaKdnY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795863247; v=1; x=1796468047;
 b=feuoK0r4nyDaNzAoDFwdsvWlb3Trh0WnkrcgykBsgksMgQW4S0MXim5Mc5F2imH3PQzUkOq4
 sjUUq93ecgzdsAi0CGSjJwZdN9MyMFfxjzVhuQNLr26m6wA0sBd91VZv4bZXvBfp2d9+CIWSRks
 UOKXkf1BGI1z5NimX9nIoR+8=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 09dfd558ac3bb54b;
	Sat, 28 Nov 2026 10:54:07 +0000
X-Mizu-Trace-ID: 09dfd558ac3bb54b
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 28 Nov 2026 10:54:06 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <64d36bd0ecc9447b616a4c8b55db121ea37b8f47@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v4 6/7] wifi: rtw88: 88xxa: correct
 carrier-frequency offset
To: "Jie Feng" <hjf3108@gmail.com>
Cc: "Ping-Ke Shih" <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Bitterblue Smith"
 <rtl8821cerfe2@gmail.com>
In-Reply-To: <CABOQOSXgnFkSyL4hN9zDpq8iU24CFyS_yBS84Ts5QPzq9ntaxg@mail.gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com>
 <20261115114336.1739863-7-hjf3108@gmail.com>
 <8ADDD0B3-609F-4E66-925E-997B11112E4C@linux.dev>
 <CABOQOSXgnFkSyL4hN9zDpq8iU24CFyS_yBS84Ts5QPzq9ntaxg@mail.gmail.com>

November 27, 2026 at 6:37 PM, "Jie Feng" <hjf3108@gmail.com> wrote:

>=20
>=20Hi Luka,
>=20
>=20On Sun, 15 Nov 2026 at 21:20, Luka Gejak <luka.gejak@linux.dev> wrote=
:
>=20
>=20>=20
>=20> Hi Jie Feng,
> >=20
>=20>  Thanks for the patch. One comment below.
> >=20
>=20>  On November 15, 2026 12:43:32 PM GMT+01:00, Ho Jie Feng <hjf3108@g=
mail.com>
> >  wrote:
> >=20
>=20>  diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drive=
rs/net/wireless/realtek/rtw88/rtw88xxa.c
> >  --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> >  +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> >=20
>=20>  [ ... ]
> >=20
>=20>  @@ -1632,6 +1637,17 @@ void rtw88xxa_query_phy_status(struct rtw_d=
ev *rtwdev, u8 *phy_status,
> >=20
>=20>  [ ... ]
> >=20
>=20>  + rtw_phy_parsing_cfo(rtwdev, pkt_stat);
> >=20
>=20>  [ ... ]
> >=20
>=20>  @@ -2020,6 +2036,21 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *=
rtwdev,
> >=20
>=20>  [ ... ]
> >=20
>=20>  + crystal_cap =3D rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK, bt=
_hold);
> >  + if (crystal_cap =3D=3D cfo->crystal_cap)
> >  + return;
> >  +
> >  + cfo->crystal_cap =3D crystal_cap;
> >  + rtw88xxa_set_crystal_cap(rtwdev, crystal_cap);
> >=20
>=20>  Could the shared helper discard the samples while sta_cnt !=3D 1? =
In AP
> >  mode, frames from both clients match the interface BSSID, so these n=
ew
> >  calls keep adding their CFO samples. But rtw_phy_cfo_xcap_track() re=
turns
> >  through rtw_phy_cfo_tracking_reset() before clearing the sums or cou=
nts.
> >=20
>=20If there are multiple clients, an argument can be made that correctin=
g
> the frequency so that it minimizes the frequency difference between
> the AP and the clients can improve performance. Taking the average of
> all the client offsets for the frames received might be good enough,
> since it gives an estimate of which client needs more attention and
> correct towards it. However, I feel like in this case, CFO tracking
> should be the responsibility of the client instead of the AP, since it
> can get all the devices to agree on the frequency.
>=20

Makes=20sense.

> >=20
>=20> So if I read it right, when one client leaves, the first adjustment=
 still
> >  includes samples from that client. For example, on each reporting pa=
th,
> >  a +12 sample from the remaining client and a -48 sample from the oth=
er,
> >  followed by another +12, give an average of -20 kHz. The remaining c=
lient
> >  alone gives +30 kHz, so the first correction goes the wrong way.
> >=20
>=20That does happen, although it might not be a big problem since as it
> gets more samples the CFO tracking should converge to the correct
> value.
>=20
>=20>=20
>=20> This was already present on 8822c, and this patch makes it reachabl=
e on
> >  88xxa too. I think the fix belongs in rtw_phy_cfo_xcap_track(), befo=
re
> >  these new callers start using it. Could the sums and counts be reset
> >  there when there is no single peer to track?
> >=20
>=20Since this bug is pre-existing and not specific to 88xxa, I think it
> should be sent in as a separate patch?
>=20

Yes.

>=20>=20
>=20> Best regards,
> >  Luka Gejak
> >
>
