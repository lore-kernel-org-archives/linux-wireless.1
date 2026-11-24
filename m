Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479883;
	b=f4hKqreU/zSyIFtBoTVFrwapJvglzTMRoj0HFYJmWBhfwbboufx3N9B90WN5CHqB9tpM
	 UeSlIhPzWGMfKN2/CsYOwhj3FyQehp30K5WUzgDipIRRT5fvjuud6DXBolqOG+KfNsuBa
	 3NqWYhVodag3w+OCzdnD46BF0k0KYCIXTajT7obuX7iCGXBrUcx41JERSgW8cO2nnBaxA
	 qYLelKM9tqVE6WtmcNkD2nSaDXfEJDBsC6hU3LbK+3JdTec4Gm5rSpjJM0mPFtGZMOZmQ
	 IW8Roc5yceDptDUesWmccT78s4sRJ164XVtkAA4JjycZlsxaZGkzx8mRbT+oGMAgItw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479883;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/h2OE1AhW93upH4aHC8bWvXF8y4O876lJtOA6fMyld8=;
	b=j/IJY7QGoNlUA50ITztRMgj7pm7l5AYrYCvtSjR6MAEuqE1I/NfLJFfqJ3W4H25yhIG9
	 sEEhk8fsw3Fm3gRQ/xtT1Zkuj2Sr8joQwYqCMi4CqZzn6hQ1Eoz0cKkAC6znjBuefFk5L
	 PAOF/mGxkuBdlbVllToV4frMrId2LChHDME+l4Ce+WsYtzfzvUo4aYX/Ii3MGsQ00AtV6
	 Z/au9WT/3cRBl2kWgYwWEs4aZRl6XAmYogpS6w0RZpuyfIZGs/oeBbrxLnJbB9Cijo2vY
	 UDXQB2CpjUd4D8ssECy1NCf4In2Vc1RzJn+poNcTefzYCCxO9dEJmKWjrpksitPEEhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UwGngYmt;
	arc=none smtp.remote-ip=91.218.175.24
Received: from mta0.migadu.com (out-24.mta0.migadu.com [91.218.175.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B2D606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69B2D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UwGngYmt
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kSYjMUNIBYHJWdhsSb2DCxIAzHZAWpEjgOxcprDD6dg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795479879; v=1; x=1796084679;
 b=UwGngYmtAHhxB4iimDuiZ87zJpBNK0JYanDNBdzp6vmkJGYUcnPdSZdrqHToJJNIGw4bKIv4
 XdPtJ87DLw0bFYOWEO6JWiLvnK+4YvGCixIMcx3YwrRHdw6DNTH/7Z5hNWYttBDMhgvwKGDjGWG
 BY+4flSJM48bQlMPc0aPlcyU=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7a0ce93e8ecb3352;
	Tue, 24 Nov 2026 00:24:39 +0000
X-Mizu-Trace-ID: 7a0ce93e8ecb3352
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in AP mode
Date: Tue, 24 Nov 2026 01:24:36 +0100
Message-ID: <20261124002437.213112-1-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121193644.603289-3-mehmet.fide@gmail.com>
References: <20261121193644.603289-1-mehmet.fide@gmail.com> <20261121193644.603289-3-mehmet.fide@gmail.com>
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

Thanks for the v14. Six comments below.

On November 21, 2026 8:36:43 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> +	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
> +	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
> +	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
> +				     usecs_to_jiffies(max(delay, 0)));

With a count of 2, if the work runs more than one interval late, it can
install count 1 and queue the finish with no delay. It can then switch
before a TBTT has had a chance to send the count. Your v13 test with the
150 ms delay showed this with patch 2 alone.

Could the TBTT pacing from patch 3 go in here so the commit that enables
CSA also waits for that last TBTT?

https://lore.kernel.org/linux-wireless/20261120170322.375333-1-mehmet.fide@gmail.com/

[ ... ]

> +	rtwdev->csa_retry = !!rtw_fw_download_rsvd_page(rtwdev);
> +	if (!rtwdev->csa_retry)
> +		rtw_send_rsvd_page_h2c(rtwdev);
> +	rtw_fw_csa_queue(rtwdev, vif);

As far as I can see, mac80211 can stop the queues before the size check
in rtw_build_rsvd_page(). The hostapd message size limit covers that
client. nl80211_channel_switch() has no check against the chip's page
limit.

If the countdown beacon needs more pages than the chip has, retrying
the same count can't make it fit. The switch then stays pending, and
block_tx keeps the queues stopped. Could the driver reject a template
that cannot fit, or stop the AP if the download keeps failing?

[ ... ]

>  	if (changed & BSS_CHANGED_BEACON) {
>  		rtw_set_dtim_period(rtwdev, conf->dtim_period);
> -		rtw_fw_download_rsvd_page(rtwdev);
> +		ret = rtw_fw_download_rsvd_page(rtwdev);
>  		rtw_send_rsvd_page_h2c(rtwdev);

I think the download here has a different consequence after a switch
than in an ordinary beacon update. mac80211 has already changed the
channel. If building the page fails, the new beacon never reaches the
firmware, but mac80211 reports completion and the countdown work stops.

Could this path retry the new beacon when the download fails?

[ ... ]

> +		if (conf->csa_active)
> +			rtw_fw_csa_start(rtwdev, vif, !!ret);

This also makes the mac80211 IBSS fix a dependency. The cover
letter says it was in the test tree, but this rtw-next range is missing
12f97c692dcb. Leaving an IBSS clears the driver work and leaves
csa_active set. On the next join, this starts work on the new beacon,
which has no countdown and starts with a zero counter.

Could we make sure the mac80211 fix is in the target tree before
enabling CSA here?

https://lore.kernel.org/linux-wireless/20261025193615.1123718-1-mehmet.fide@gmail.com/

[ ... ]

> +	} else {
> +		rtw_fw_download_rsvd_page(rtwdev);
> +		rtw_send_rsvd_page_h2c(rtwdev);
> +	}

If the station's association download was deferred and the AP stops
before the next countdown download, this is the first attempt to update
the station's templates. The builder replaces the AP beacon with a
dummy page and recalculates the station page locations before it
allocates the download buffer. If that allocation fails and the AP
beacon used more than one page, the H2C can advertise new locations
while the firmware still has the old layout.

Could we send the locations only after a successful download and
retry the download if it fails?

[ ... ]

> +			    WIPHY_FLAG_HAS_CHANNEL_SWITCH;

What happens if the AP on an RTL8822C changes channel while the station
interface is associated on the old channel? So if I read it right,
mac80211 reserves a replacement for the shared context and the
combination check accepts it. At the end of the countdown, the old
context still has a station that did not reserve the new one, so
ieee80211_vif_use_reserved_switch() fails and mac80211 requests an AP
stop.

Could the driver reject this before it starts announcing the switch?

Best regards,
Luka Gejak

