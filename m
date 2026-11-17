Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900025;
	b=xjLN+fInHupavzHr+BStT+Iqd6CVl/Rnl0qOPkmur+U+4NUXICLSGHL+uSBCR9zN85CA
	 45IBG5if4dqCIFXfGsAVziLU+g3nPz5vgENfw1ajJXH3fOE0fovnWRChgylHRTHyalwfY
	 qtFMM90wibgVUUN9I5rZUJNPzyklvMYeWs11I3aBe4a+XTvHAZ4n2d35Xr22kTzrzIWzW
	 Qmc8MN/wIpNfG8gWXOP0z7yQCIj4E5Bzginz4LIQ3CkKa3HHg6Jp5sv5GxleZKkKPPoZv
	 2r/74cBuK3tY8cAT/7fQPuep7FwlXbsBjgVn6QnJu3P94kFuRJ8z/Oml4DRBm6s17FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900025;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jq8pirwHCDBjHczrIow9hfLd9FNV9oipiUXhXIMuypE=;
	b=5IPytNfQUp8BVA33qXaGVOd3BIIDCouVx5XE73SSU4thdIWksXhZ6hRlQNLN3iPA4Txp
	 dwr7FBiTPzbNuUdGy3/MbsuGThwnQkN7gtqjE9g/E3GCyev83jtaplhNRQEht8dbsp9gn
	 Ia0ql1oAerkD3PoD8hyZ3Vwji6mzkCZq3adwB9N/2oQ4wRfDUvZtcWSUIbLhML5IE7tQR
	 Cuz5HKzZmrrm22/LHI9ezBLPoPyv3POaUvx01lIZ89fuYMffn8diILChVrVT0TSW41UrY
	 DFh80FRPtVc2+Uqm8gcRtyAxVMZpWInX9tpIwkbc6uRh0gCWgMRtAW86IXftbsnePPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dRMjOMA+;
	arc=none smtp.remote-ip=95.215.58.79
Received: from mta1.migadu.com (out-79.mta1.migadu.com [95.215.58.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47813606A323
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 07:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47813606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dRMjOMA+
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/wT/xjc/A5pWF9M3+pmHS24DpE6FHAK3DS4o9xG5i1k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794900022; v=1; x=1795504822;
 b=dRMjOMA+i3QXAn4jJQ6sf+xk2g4wDAmX6/4PtopwyeB0E+lV1HJ3gS1xLY6QEWrBtOfp56ZJ
 5zmhnDv1fbOJV8hkG5+98k/XvgbsKmOXSSJPEfSf+Ej6v0eGvT4UQGc5KGvJ8XQGwskP8bM2XJd
 Pscc34LLf0p3jFcguKQxsl3I=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 14a02e8760ccc26d;
	Tue, 17 Nov 2026 07:20:21 +0000
X-Mizu-Trace-ID: 14a02e8760ccc26d
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 08:20:16 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: =?ISO-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>,
 Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
CC: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
 Alastair D'Silva <alastair@d-silva.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_1/5=5D_wifi=3A_rtw88=3A_sdio=3A_c?=
 =?US-ASCII?Q?ache_the_free_TX_page_counts_of_the_88xx_chips?=
In-Reply-To: <20261116190145.2736364-2-david@hardeman.nu>
References: <20261116190145.2736364-1-david@hardeman.nu> <20261116190145.2736364-2-david@hardeman.nu>
Message-ID: <83F543B9-2066-493F-8372-0E36779C1B04@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi David,

Thanks for picking this up. One comment below.

On November 16, 2026 8:01:41 PM GMT+01:00, "David Härdeman"
<david@hardeman.nu> wrote:

> +     free_txpg[0] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG);
> +     free_txpg[1] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 4);
> +     free_txpg[2] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 8);

[ ... ]

> +     rtwsdio->free_txpg_valid = true;

As far as I can see, a failed read can leave bogus credits cached here.
While the chip is powered on, sdio_readl() returns 0xffffffff on an I/O
error, and rtw_sdio_read32() only logs the error. That becomes 4095 pages
in each affected page count.

The first frame can still fit the real page pool and be sent
successfully. The cache then stays valid, so the next frame can be
admitted using credits from the failed read even after the real pages
have been consumed. Previously, the next transfer would read the
registers again.

Could the sync return an error and leave the cache invalid unless all
three reads succeed? The individual reads used as a fallback in patch 5
would need to preserve their errors too.

Best regards,
Luka Gejak
