Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794123252;
	b=PNR+Zg/WRA9p6xelpBQ/AAlw0DyB8OsKv0aY6c6FTvoEgy44aSqhiGX15O/oabHn1qQ4
	 1t212kNDM090iIApkQ2QbPJ9Wr9sZGMqU58gblyDWLsiLLEQPuPLXxHyjXeziXYVpn3W7
	 2YfnD6nhHCOMQZ6SL4Cm+/GNgSM1ZC76AwQFG4+/r28cDyRkyeRPckBOuesy6dv6WMGhw
	 xOWORH7s1NjyGcvvzT9M5yq9MrgVOgJUGc/vSInX/zBI59B2w1CAC3mLODVnMwuQDod6W
	 WvZb+5LF1v1UejKJ+ZMqc3Ush524ir4B5uML8acefLXB+BUuXpY17DIuBWe4mtWs4Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794123252;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=uvVu51tRVZWMb70zfIv9bd+fctSfoJcWNKD6AYmaqLY=;
	b=W15WXicifOS+ilo1z4BcxUppsmDDK7DBQ0SmN8L6iv1j+8qxbaScFaS7WuhPZOuebhGi
	 s3Gi+w+mPus2y2suWXSQQ6xC+FkypfS+zxnOX5k2hH0q6vJiHBZD2UWbvh71ltY+TpbWd
	 +30gk67Cy5Bm2Zqkr9QQQAlFWQRHej5o0Py2BLoIICljzX5W9beuLzOkl1syxhsJJVYg9
	 HqHJA30KdKpCyRmAhAYHC9c3T/0Xep/qwBrcNaHQmdeC/E7RfYVmf7lDwZy/hLkZNaogS
	 4C8mDHJrPhN1jED+Y1ei51pS0h336+jhOzsgElwVJAzX2mFJksMXZtrX4Z5t1DcCuSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fD0rpWsu;
	arc=none smtp.remote-ip=95.215.58.118
Received: from mta1.migadu.com (out-118.mta1.migadu.com [95.215.58.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE422606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 07:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE422606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fD0rpWsu
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uvVu51tRVZWMb70zfIv9bd+fctSfoJcWNKD6AYmaqLY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794123247; v=1; x=1794728047;
 b=fD0rpWsuut4Maildr7LeT7TeuzBdq+BsuvbEwcTLCKN1bc/zK9ZNx5k8btPtObPHQCY0L7wX
 xWktIozpFIzEiWiqk1bXcQWiarwKfDRJEqweRA0OpfFwFGAUKJEXiaLwoRvKxvImrn+P0kiNAl1
 tvD1OgmAJZphlExnFMHHct0o=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 095332b7db821aee;
	Sun, 08 Nov 2026 07:34:06 +0000
X-Mizu-Trace-ID: 095332b7db821aee
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
Date: Sun, 08 Nov 2026 07:34:06 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <4f3b37d5e7bdc710a54e46b4f28879b4f51ff15e@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 0/2] wifi: rtw88: 8822c: check register
 values in cck_pd_set
To: "Zeshan Ahmed Nobin" <zeshanahmednobin@gmail.com>,
 linux-wireless@vger.kernel.org
Cc: "Ping-Ke Shih" <pkshih@realtek.com>, "Kalle Valo" <kvalo@kernel.org>
In-Reply-To: <cec3629205b2535d73f5285caddec290e7bda1c4@linux.dev>
References: <20261107183403.50696-1-zeshanahmednobin@gmail.com>
 <cec3629205b2535d73f5285caddec290e7bda1c4@linux.dev>

November 8, 2026 at 8:32 AM, "Luka Gejak" <luka.gejak@linux.dev> wrote:

Typo:
> Do you mind resending this series and putting linux-kernel.vger.kernel.=
org
> in the CC as well.

linux-kernel@vger.kernel.org
