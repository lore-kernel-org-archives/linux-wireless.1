Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184158;
	b=2wwah6dOgm57WHvVJ9dF4gp7zc5v1DbUh9jH+6L/PBtERB012PBfcAZhoamj1xChdsOt
	 KPvPqMFjATUKlC2TG621ayhLtIIr7zhkI0AIFclItr89bH+I2hvkx4AXT6myxq8Zx+xqZ
	 o8IGtD/l+Vpq98xrGDt3MKDhEU/WMTvrYqVwKZIfy6brzBJ+Jv68EGQtVDhg3bZEmtyg6
	 wsUhsVSir98IQ4K4v7leQ518dwzU6OhTJejy9QUlJSxXY5wLL3hNe1tN4Zo1qV3fitDHQ
	 PVsNvOLgmuA0LUXgJBjwdL+zhiwVICByoAG2AP3XlpnmPqkVxLxCF0+SySkrKz/zHkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184158;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=djB2H3+AUQ9UAbVwoV3xtP+1jF+PYLRTPsj+L9Q3i1M=;
	b=zUglmb2U+ezge9hziKB/qTl7QwdFUUn5zgIeILBW+p6Y506rf3wKbCNBJCPpGN8QWg1i
	 kEPnUHPVqsN0A3j6KqcQFKRZOSc53GMrD9+vzKxhuvd6BtIhoJfi/5W4V29FETrD+3GL6
	 Ub0ENu4hbzkxwfrLLp9d5AFg3m8hJdhjrH4Bmwhh0JLST0Wh2LHyjih5CYRA3NTp8wHZg
	 H9J8ow6q1cyxP7en5PARHL3Zxw+Pp8yld/YjiGCEqBTltUTB9v947oUJ5wKZ98dnq2/zN
	 GrB4T71snK0BcJG2bse9wFLchcOqCf2o9stjY5CdzDTn3jgwY98yq3DM5aXH4CbTEPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nA4LPU4z;
	arc=none smtp.remote-ip=95.215.58.34
Received: from mta1.migadu.com (out-34.mta1.migadu.com [95.215.58.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA29606A325
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 14:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA29606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nA4LPU4z
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lE8gxDYPl0F/rxqZxvrtd0Gp/XDxMqiQ0Whg2ioVnuA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795184155; v=1; x=1795788955;
 b=nA4LPU4zgSNZ/8YONIIRsAmATpGC0SV6lZjguc0uHGLMmNC/ZVmIqb2gU7X3a7u6BhX5R+Kj
 adk8TixfE0Umnoia9Xu78YFac8Pte6cGP901GVw3m4+wHyFhU7FwC3xVYycSuWxGOcCURjEzmve
 RYvWIh+bQVVFziSRpqPAJA2Y=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1121a40b1b8ff3b8;
	Fri, 20 Nov 2026 14:15:55 +0000
X-Mizu-Trace-ID: 1121a40b1b8ff3b8
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v13 2/3] wifi: rtw88: support channel switch in AP mode
Date: Fri, 20 Nov 2026 15:15:52 +0100
Message-ID: <20261120141554.68116-1-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118231940.3950-3-mehmet.fide@gmail.com>
References: <20261118231940.3950-1-mehmet.fide@gmail.com> <20261118231940.3950-3-mehmet.fide@gmail.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mehmet,

Thanks for the v13. Four comments below.

On November 19, 2026 12:19:39 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
> index e0f3e1adb13f..9d5df3e65b97 100644
> --- a/drivers/net/wireless/realtek/rtw88/fw.c
> +++ b/drivers/net/wireless/realtek/rtw88/fw.c

[ ... ]

> +	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
> +	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
> +	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
> +				     usecs_to_jiffies(max(delay, 0)));

I think this can finish before the last count gets a TBTT if the work
runs a full interval late. With a count of 2, the work installs count 1
and queues the finish immediately because csa_due has already passed.

Patch 3 measures the next TBTT after the download. Could the countdown
use that pacing from the commit that enables CSA?

[ ... ]

> +	rtwdev->csa_retry = !!rtw_fw_download_rsvd_page(rtwdev);
> +	if (!rtwdev->csa_retry)
> +		rtw_send_rsvd_page_h2c(rtwdev);
> +	rtw_fw_csa_queue(rtwdev, vif);

What happens if the page can never fit? On RTL8821C the driver has
eight 128 byte pages. A beacon that fits before the switch can exceed
that space after adding the CSA element. The builder then returns an
error every time, so the switch stays pending and a request with
block_tx keeps the queues stopped.

Could we reject a template that cannot fit before committing to the
switch, or give up and stop the AP if the download keeps failing?

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
> index 3029fbdb288a..c9ac2685437e 100644
> --- a/drivers/net/wireless/realtek/rtw88/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw88/mac80211.c

[ ... ]

>  	if (changed & BSS_CHANGED_BEACON) {
>  		rtw_set_dtim_period(rtwdev, conf->dtim_period);
> -		rtw_fw_download_rsvd_page(rtwdev);
> +		ret = rtw_fw_download_rsvd_page(rtwdev);
>  		rtw_send_rsvd_page_h2c(rtwdev);

[ ... ]

> +		if (conf->csa_active)
> +			rtw_fw_csa_start(rtwdev, vif, !!ret);
> +		else
> +			rtw_fw_csa_stop(rtwdev, vif);

Could we retry the first beacon download after the switch too?
mac80211 has already changed the channel when it hands us that beacon.
If the page buffer allocation fails here, the old page still holds the
last CSA beacon. As far as I can see, the switch can be reported complete
while the new beacon is still waiting for another update.

[ ... ]

> +	} else {
> +		/* what a countdown may have held back */
> +		rtw_fw_download_rsvd_page(rtwdev);
> +		rtw_send_rsvd_page_h2c(rtwdev);
> +	}

There seems to be a similar case when the AP stops. If the station
associates during the countdown and the AP stops before the next step,
this is the first chance to install the station's new reserved page
contents. A failed allocation here can leave a PS Poll template with
the AID it had before the association, even though the station stays
connected.

Could we queue a retry for the station if this refresh fails?

Best regards,
Luka Gejak
