Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794114885;
	b=blUc78kLdaWb7tcJifaUZ0dkgW0NksltIHO+cwNHPDWCuAyhZW3Clnd7LNKAmY/Xjfmf
	 qlwajGW3Ca6d6i0lJ/idAQhF8NTpShju/G/73f09qth/XvxZJMYPk+oLYw+t395vV8cFW
	 4zNqer8x3KSIlP+3jpcY8osJwIATgg+oCzi2c+iIK2LLflQH2Rgf3GpmYuQpuS/MiZm+K
	 EHsUZQbWA1ImSzREU+poru/ESOT4SFMgxA7fwJ/2aVRkQMv0XnJwIARfJtR/QC6E+AWhq
	 fidPdhq3aylX8t0EyUTbnE5gnrtBu9dQxEowg5EkeEV56pde6ERrabjz7f7WVOscSrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114885;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=bTG+jYNk4qm7A/lZQ0O5Rx4J/W5a+BuKxCiBRuMchoI=;
	b=R4yafmUIDK+R/8ZdXOPcEHM0oDUPC0RuVUpXa6gLZzLrgZzWkXgp8l3KZ00hd0187g6N
	 att1kmlL/MdmpR54nVSjH98Tmr9KdlSZlLiI5B9cL5sHiTCY/gNYINuVyCChB73FU8GQb
	 3FDGFtIq+M4X9rltTNjKtb5g5wA8P8vM042Kkg1zhBcMNsVlo3dQPzc/vGFhFx4c9qQbS
	 cmdSgpytPWyTNlBkrdSdsiFDDxqLZ4WrbuEVPbYHCcPKVIp0a7D1v3I9biCjdiMxu9Upl
	 lXsg8Ycb8Yf5xVc2T1hBRqoGYDJC4TugKAZr6v/LspthO8Dt+cfazF7kHYNiiEqynlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=v8gQG94p;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6FA606A31A
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 05:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=v8gQG94p
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id 55A76401FC
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 16:14:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1794114872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bTG+jYNk4qm7A/lZQ0O5Rx4J/W5a+BuKxCiBRuMchoI=;
	b=v8gQG94pDrEge4N04kxw0iJBaV/KlZ1x+ywzZA/BiSQtxR6lpa+cilugpbzwBP3fblqj5p
	4Z/21AvtwTI8JN8wCjBMTblAfUnRGdmOsS+ybHsqVPnEZSNnlww9MjzTtqINb6UqLhP5Dk
	/mHTjZavZRH8MHqQHaBQ6yYxoRMTYFUhqLjJ6GZ+XPFXL81ikxLc6+mddwXGPyXsTPZoCO
	veOzRlfN8SPb4fAPYgihc5okPa3b/bWkkncXi41lJU8scIX2NFUNbo2yBwzCmUfzjMP69E
	VWCXSegh0Sb/lftd85n7jFEhgGXPcYz7JwZ0ULU9QryxJHoEPNjCb0IPATufWQ==
Message-ID: <b1ef13e1514032032577c520d3c926ae26ccef0c.camel@d-silva.org>
Subject: Re: [PATCH rtw-next v9 0/4] wifi: rtw88: sdio: Fix unhandled RX
 request interrupt storm
From: Alastair D'Silva <alastair@d-silva.org>
To: linux-wireless@vger.kernel.org
Date: Sun, 08 Nov 2026 16:14:32 +1100
In-Reply-To: <f2784538533947a38e9d03af7bc7fce8@realtek.com>
References: <20261107035321.1210303-1-alastair@d-silva.org>
	 <ab3dcde64bb90809ae10627803315d7385d6708e@linux.dev>
	 <f2784538533947a38e9d03af7bc7fce8@realtek.com>
Autocrypt: addr=alastair@d-silva.org; prefer-encrypt=mutual;
 keydata=mQINBGactvoBEADBFM2HqfQUUM4j40ZQPyYzmnM8S6zrycO0ipDDPMs7nZMzyzGzOdqfS
 VB/tuYvZOOKVWzJuWJ5aT/YyHx54r3L+D5hTkEG0sXPVJky3yTS9sbHEMSLBHb8TVVuhPVPuieV4g
 Nkqg5POMTidk8xAw50WpV++tUlewXVSciehnuCQPXhXMP7FcCh4uO8LdN7E8m7ir1LafKTFfoWPah
 KVT8NGG9r+ucrFcN5F+VnHxTDaI68yRPkNdtUWmp22wIX1KwDCtKFrndYO4p5Hv2hlDKomsuIIHHn
 muQGRwuh0xpf0nVJNF8ETZHMzxQLfo3e/HvxBFOTkwY9w7CuuQFZchbhS0I3PfmGT0+jiNcdfqjDC
 fPPB5uhy+DkR6wO72vuwFYUrpU2mdliDSdKEtWBHulnXMJjpBOXetfIwhI8G2dTVg59lN5i9DvJZc
 7y1Sp+qfZQ4P9qpYZyQEKR4GNDOdnm6F2LW2cZkcyAU/Ii765zdDMTQMIzZNSxT/FcDd0K1voTNRl
 QHbQw+kmIMhzSv2JefcC9oNbE0XYzcBDNP5T3O/4itOQ90GCKQEPAbIPeBjlQif7kkyvo/H6yv4s9
 duuK7zbJD9AID/+KGLkpU3p68VDB/C2ZSb9rQz3p1CJNSfsX/CPk7sPqA7RKZ4a2B0hSJ2pJCncNZ
 KXtMlkkm/FmewARAQABtCdBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz6JAl
 EEEwEKADsWIQTQGemDFwqYyU/dBWv75AdnjVo60gUCZpy2+gIbAwULCQgHAgIiAgYVCgkICwIEFgI
 DAQIeBwIXgAAKCRD75AdnjVo60qHZEACJnLfpS71Hk8bX0CLCNJ5wgqdZD3pBHEdbv9Ux9kRlZp4a
 ZFwlg9ltwBjl2dZP3PLtD9xQdsdYKVippKd5a7ZZC2y81oDaHjeC9LnPYn8+ce3mGE/+gRyoNfToY
 N06DeUNJKSlZ9t11UIqZCgfp12u16/Yrigy8C4ihEeHXlLhNX6JkeJR5gsHXJnC7vSuMZY+Qz2R72
 ZidWg+cd2WDMGop5sbTvc+55q94A7vTMlWzaix5HdbEUA3sd2U0dMBju5QodRGGhDQMcCu64TydRD
 MtMzzOk9ThJ036ze3HASWGOppyQmaw58k+XNzbHlr9Sc1LsFUNF7zpWXac2rzlywbyRAdFIT/TC76
 hy9zOkwIo2nwA/tdIwLx1j0UZPpAMQmcDUvJqZh6sE+fv6HN0yMPr+sSYJmriMt8Z6leCEHQXOHVI
 SI5z5FvV3coMmHYRq6aXpfs/8SLiYgkV3B0HE/E18Y3j1OkeLYoqIH1VfzQZeCSL/S77NYvk60/MV
 1HFSyqLdUR3uWZI4uZzoEcMoB0GX33uCTp2Ntc00+wSntwekCUQLCMLUb7dZrbpVuobHoWWtkiD2I
 uE5kAiaVwwwzM0BUwiM6VzVoKbeECz93rdsNtwoDqM0NtzoISC46H/BKVQ9mRNXDO4ThEBpJ4H2Tn
 mPNRYYcR0u2mNy1EJII04w==
Content-Type: text/markdown; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 2026-11-08 at 03:06 +0000, Ping-Ke Shih wrote:

> Luka Gejak <luka.gejak@linux.dev> wrote:
>=20
> > November 7, 2026 at 4:53 AM, "Alastair D'Silva" <alastair@d-silva.org> =
wrote:
>
<snip>
> > Thanks for addressing those comments, v9 looks good to me,
> >=20
> > Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
>=20
>=20
> I don't know why I can't see v10 in patchwork [1].
> Please take Luka's Reviewed-by for each patch, and send v10.
>=20
> [1] https://patchwork.kernel.org/project/linux-wireless/list/?series=3D&s=
ubmitter=3DAlastair&state=3D*&q=3D&archive=3D&delegate=3D
>

There isn't a V10, V9 is the latest :)
