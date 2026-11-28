Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865398;
	b=erTP21HfkLod2teehLyZcYuJJv+z3cdUW9nvER57HTNmDpMdM31y+ctInjbGABrB5/em
	 bvOS4k8UlWZvQd7KRiqQIp21l16fPyJVeTLYUAqpwIkUACRUFH+iyYCEsjmT7UMNq6nCL
	 t8nc9xQaqVTdTgVFdiGGyATIUhf7/WMcuSwsMpaZEzXFofSbzwTSwzKv3+w3P7GEDRtlV
	 yCMh7TKyS4S9IhkDBMIGALaHRj4z8n0goHNkHzMVjm69qjODwtCyK5tgL9VcRQF4GKZf3
	 Kw4F7dBnNKJzVDY9+3vr4cjs1PRcjSXS1yJep/hyUJN7UUD8rgO43XcjZssQuAhuwaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865398;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Br+60WyY6NR3dzXOr0caHGzfgUSLm3hs8qRDSmm+z4A=;
	b=iahZ85TQ/dabQ4a/EKYVIO+skCymVcfsRzHvmm3osbcA8fh0WtCvtgttyTyWYwHtWeSS
	 kPbBYFDvnUccq7FG8RLEkI6RuMPDQDwUEVJpXEfxP4IxHm1jVMv37pLavo8AFlbG+6NjU
	 uIvpgsRk3RFeHZLcIc/a8NAla6oLxCgMr4waF59JK5pTlBCI+G2hVumf5Wi6VT7iGCztf
	 E/3Hcf26MTL6V/9tWLxIoGDLfBT/Mv5CXCeu4FN6Gvp2NqtUxaVncn3LXJ4rv6Hz+hTMU
	 gawIzdPFLYYoE1ZE2kn7/tV6j+RlKub6LgafpOpoTptjI1sZ62b6+l59cAhTKo2EJHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o8BqW6X5;
	arc=none smtp.remote-ip=95.215.58.201
Received: from mta1.migadu.com (out-201.mta1.migadu.com [95.215.58.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45145606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 11:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45145606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o8BqW6X5
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5BGU4dffwsCQntkrU2zrHwagqeiQz8YYA2a3BmXfx84=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795865395; v=1; x=1796470195;
 b=o8BqW6X5ESXea3nJyeBxRrXBhJ0gpQRjliUAaFTrLO04Iv4F1HW5bUVwYXvgOP6uEE45ggVU
 pAk5m58kQ/C3L0xv4nYuYxzGEVC6NWYQ8ZvvPFPJmvvtcpRTRASbMju9QHAR3KXNyV9YyHZcpUi
 12LImKM+o4KHfuc2dJ/Cloo8=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1e1f7f0487722a26;
	Sat, 28 Nov 2026 11:29:55 +0000
X-Mizu-Trace-ID: 1e1f7f0487722a26
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: Re: [PATCH rtw-next v5 6/7] wifi: rtw88: 88xxa: correct carrier-frequency offset
Date: Sat, 28 Nov 2026 12:29:53 +0100
Message-ID: <179586537111.18963.10245502413702250015.rtw88-v5-reply@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127180034.1058591-7-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-7-hjf3108@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jie Feng,

Thanks for the update. Two comments below.

On November 28, 2026 2:00:26 AM GMT+08:00, Ho Jie Feng
<hjf3108@gmail.com> wrote:

> -	for (i = 0; i < rtwdev->hal.rf_path_num; i++) {
> +	for (i = 0; i < path_num; i++) {
>  		cfo->cfo_tail[i] += pkt_stat->cfo_tail[i];
>  		cfo->cfo_cnt[i]++;
>  	}

As far as I can see, RX can update these fields while the watchdog is
running rtw_phy_cfo_calc_avg(). It reads the sum and count separately,
then clears them in a second loop. A packet that arrives in between can
be counted against the wrong sum or cleared before it is used. That can
change the crystal adjustment even with a single peer.

I think the same race exists on RTL8822C. Could we take and clear the
samples under the same lock as the RX updates before using the helper
on these chips?

[ ... ]

> +	bool bt_hold = rtwdev->efuse.btcoex && !rtw_coex_disabled(rtwdev);
> +	u8 crystal_cap;
> +
> +	crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK, bt_hold);

So if I read it right, the helper returns the current cap when no new
CFO samples have arrived, before checking bt_hold. If the RTL8821AU
already adjusted the cap, a firmware report that Bluetooth is active
can set bt_hold while WiFi is idle. The cap then stays adjusted until
another CFO sample arrives. On 2.4 GHz the AP may only be sending CCK
beacons in the meantime, which this path doesn't sample.

Could the Bluetooth check restore the efuse value even when the sample
count has not changed?

Best regards,
Luka Gejak
