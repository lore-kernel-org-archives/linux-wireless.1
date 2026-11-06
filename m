Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996861;
	b=WvyU/j/R47HdNZmdKOQ0+/A8imyBz+keBcT6Bb31VsI2IzDl6dAGXNw/cHNvmUD7VaWa
	 3OJA5AmBNZyfltwypemNCwjBuh7nFoW7wzo0tpHvZ+ah1I0If0aRTKn8gN/J+e+t4JMwq
	 GAAfvl3qxnLckBxhX/oTNzGo/DKkO+BXQ6g5o6BG9hnTJyIoXu7ynxOFyUjtCglF7y+vI
	 qkGULnsv76FwNfXTR3YRnNk8FjAMUbHmyyOYR/6gtczwtbDMavtSlcTlz9bczfbck0jPR
	 4rs+ybw8YG0zqN83wUIwhklSaBgKnEnILSR2XTE1o61K/SrBrcQHv96Ri2JY0HSvjNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996861;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=5CwGPfss3o4B2UDwxJPyt7xPqbandq8EHhhTglsWcE4=;
	b=qrXPcsL1dbAIOhFDOoLrFJB7BodbkKAKeWIB7fGWUzh8tRBXPyxSJc4T7xHLP1Rj6gKJ
	 2Yz5JyEg4ulVwCBpJ051E7Wl/7PhQPtav3/9W9AjJnWpRtu63yhmPTd4BV4Hy5FnrOfQT
	 sUo6GUtVkO1ndmXghIFxY5DNnxN/Cd9mCFwfPxtvRP/a9ra92C8lKkj11KiZ/zO7Fp4iC
	 1tF5g2rq37oSuGWgQDXSZYDH5487sn3QVHEjuDprDu9QNWM+8YqaY79sAYc8UwxR3m0At
	 UQGStYjOjuL/tSib00MP8ciZAN0d4JG5ceS9106cUlM2PsnShxlNGQWhFBoLXhSrSRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.216
Received: from mta1.migadu.com (out-216.mta1.migadu.com [95.215.58.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A431606A329
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 20:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A431606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=43lSI3je5SgzVn0fvn0HfJb/Ol5l8VVjob7w0n5ta/k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793996848; v=1; x=1794601648;
 b=KaCVBGhOFNko4IdzlRU2aIGG4WN0YSqAO6FhiAglIuFMTGCFOVl1y27PZ6s6EXzmJGiSYAx5
 wCdtaSMl8BfQyK/fBfy9sysOh8fJA9mAfRzTLc0lc8MjVRIY+V8fk0Eerw84NA/2pNoKsQxDnqo
 CdNIbSsroH/6foBdJ+N51WfE=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 009fa777757b40f2;
	Fri, 06 Nov 2026 20:27:28 +0000
X-Mizu-Trace-ID: 009fa777757b40f2
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
Date: Fri, 06 Nov 2026 20:27:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <1d7fe388a84ba7a078efbf1972869d63cb8234ea@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 6/7] wifi: rtw88: 88xxa: adapt channel
 sensing to receiver gain
To: "Bitterblue Smith" <rtl8821cerfe2@gmail.com>, "Ho Jie Feng"
 <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <3bd7d396-bb54-41bc-890a-bfeab90dca3a@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-7-hjf3108@gmail.com>
 <4ada79186cd882a6d3344c43579e5addc4d4e644@linux.dev>
 <3bd7d396-bb54-41bc-890a-bfeab90dca3a@gmail.com>

November 6, 2026 at 8:46 PM, "Bitterblue Smith" <rtl8821cerfe2@gmail.com>=
 wrote:

>=20
>=20On 06/11/2026 19:34, Luka Gejak wrote:
>=20
>>=20

[ ... ]

>>=20=20
>>=20 Bitterblue, did you turn EDCCA off through the edcca_enable debugfs=
 file?
>>=20
>=20Yes, that's what I did.
>=20

Thanks=20for the answer. So I think EDCCA itself is fine with this patch,
and it is the lower thresholds of the adaptivity mode that keep the
firmware from leaving LPS.

To me this looks a lot like b0435910e47d ("wifi: rtw88: 8822b: Relax
ETSI EDCCA threshold on 2.4 GHz"). There an RTL8812BU running as a 2.4
GHz AP wasn't seen in scans and failed to get TX reports under the
ETSI threshold, mostly because of energy from the adapter's own USB 3
link. The fix was to use the normal threshold on 2.4 GHz under ETSI,
capped for EN 300 328. Your network is on channel 13, so that would fit.

The 8812au vendor drivers don't use the adaptivity thresholds by default
either. Both v5.6.4.2 and 8812au-20210820 build with

        CONFIG_RTW_ADAPTIVITY_EN =3D disable

and as far as I can see phydm_adaptivity() then stays on the normal
(mode2) thresholds.

Jie Feng, maybe doing the same as 8822b would work for v3, the normal
thresholds on 2.4 GHz under ETSI and the adaptivity ones for 5 GHz and
JP. Bitterblue, is the adapter on a USB 3 port, and do you see the LPS
failures on 5 GHz as well?

Best regards,
Luka Gejak
