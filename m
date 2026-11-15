Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749745;
	b=M8AaXFKySZLj+Vtk2O66DdmyNgxO+IOiCoCKDoh10QHpdOHi4SK1aL5y4963X6sRltll
	 G/AKcmCo1Jx7rI5Je/sBFlX9s2zRgbkdgoCc/wo2qeWPC8iAPx+Oxn8/Zot/BpMzxXBmK
	 Dxx8mZSJl/QtBc0bQGI8AvqvJScOocsWzMHy7wER+1DxnE+sFyl9/Y3U7BVaLY9NryMI5
	 aeHGuXHM8ucNzR/AN59MDT9UoAgxgxmjbZLECv2glV2HV4H8hBSpimdKwujd6yOcpFNyY
	 i+9BeQVfcJCDAKc3pspyAY3WcyS+HFqVSTxo5hs2UykboyEsQrUmXMD1QGcw8SeZR9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749745;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=h6OEXgSIS2KSn2gzGHEkOO2aDOY6x2JBf4c/xK1Coeo=;
	b=cgJzMoKoaVzde3AzA2mrSc8Go+xLChJO/yWmdpCSsUFRE3kMceYcknKumomfUfMqMGlt
	 SLl3Q+wlknQjj7XIn7jWLsY1BV+X6VYRAus8cfSPqvf/9HCHj6WZ0O5Gc59Ua0qMSgFbi
	 O+9PJgvSajqtrXj/bX7byqIOIQrFIV3EP8aSy4ukmDxdcl2o5hYmgTrfeLXKZ8bzTyV60
	 25Le3TMTtaK5z3eZpMNU7cAFrqUOM9xx6E80ddV+HxEGgrdevRKqSsscHXEKPZosUWPTy
	 Mh+X665CbliRu7La3TOkWWk3H2ADZwdCGeLMXoRl4OFQ8AfE9SjLOZm8yUsew5hr4fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UhhPFDGC;
	arc=none smtp.remote-ip=95.215.58.192
Received: from mta1.migadu.com (out-192.mta1.migadu.com [95.215.58.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFB1606A31E
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFB1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UhhPFDGC
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h6OEXgSIS2KSn2gzGHEkOO2aDOY6x2JBf4c/xK1Coeo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794749742; v=1; x=1795354542;
 b=UhhPFDGC2m9MeRClvUgoQAVhnz4PsNPJR7tU/4zO+vnMOIo+6CXdqjeIMl6RrniKfG9DqcGx
 nX6asoYQpUjsfpGPvdJlJp39B2Z25DjiLPlru9HZbBUf26ure/JucYoDBIxilzsHkZWiwoSBeAN
 F096Jg6Q4VgWKqwm8vr75hPM=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0848c2a5e9df1cac;
	Sun, 15 Nov 2026 13:35:42 +0000
X-Mizu-Trace-ID: 0848c2a5e9df1cac
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:35:41 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_1/7=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8814a=3A_enable_STBC_for_HT_transmissions?=
In-Reply-To: <20261115114336.1739863-2-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-2-hjf3108@gmail.com>
Message-ID: <56FC313D-ADEF-48B2-BBF5-A4DFAC129C3A@linux.dev>
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

Hi Jie Feng,

Thanks for the update. Two comments below.

On November 15, 2026 12:43:27 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> 8812a and 8814a support STBC, enable it.

Could you mention here that this enables HT TX STBC on these chips? As
far as I can see, VHT TX STBC was already advertised when more than one RF
path is available, so that would make the scope clearer.

[ ... ]

> Tested on RTL8812AU, STBC packets were captured in monitor mode.

Were these HT transmissions from the RTL8812AU, for example on 2.4 GHz
or with an HT only AP? As far as I can see, we already advertise VHT TX
STBC on this chip, so a VHT capture would not confirm the change here.

Best regards,
Luka Gejak
