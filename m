Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902281;
	b=5D1vXWzEr/YeCgxCQRkz5QBlCAmpqbWgy5gXLOFGEIPU5iGPX4qICE5Nc/X9EcekQC0i
	 zhMlHV+pz4IdQ1+Db8OgylAjj/b/9z0IluYX8akLHeg/EpRJAWAYoiAfKa/hOge4F0AI0
	 XVpD5aH8QSj4fiTFZd2yDcPFHJtQX45s/lldxjBaz1ZapupNwUGF0w07RvkKvoLjy4gBc
	 ZGBEFIVM593ZhRMUvPjgkXy/K3ZkYieChLDu80Yhn9pyRibpfCaVPYCpoMWbRQ1FG/ZYA
	 ndpJl6ZCbd0ng5/qN7brrHFFStfJob4mpajOMUV0GlxAxJYH7MxQ6rC1ivwqPlFkPFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902281;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=4kqa9paj+lVwA6xSv+UEpwa5dIHpfQf1zg/Mb4TAFjA=;
	b=F24gykW2124hM6mZKx3tvJRZq6TQKYhzBQUCdlnMDAFKfKAVMnAgTBAvStknxEXsW/FG
	 UcaeHmfbnfWTHbeF8bhU5OddhUDjG4s0rtLfiH7SMQzyCs9yA7URe5iYTkh3kL5sS6QqJ
	 8M3UT0Z2xWQH3yr8ip6+DprECxOW0f0P3y020fxXza7Dm81XIlVrwM0i1r6i3lb/eOV6w
	 EEAqEQzXz8WZ4EgUyxzQ9nTKY5No1l1x/DwuXRhRrZSroXLkSjr3pxIH/aSSmcmqvn0He
	 VTEwRX76OQH2/CU/PQf9EIdtN2pimJqJTXsPW1PlDI5Nzq+cR8rLH85wvWfjzEiVshA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=HRF+t1c5;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C597606A32C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 07:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C597606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=HRF+t1c5
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH7vwtZ7064397, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794902279; bh=4kqa9paj+lVwA6xSv+UEpwa5dIHpfQf1zg/Mb4TAFjA=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=HRF+t1c5kaER093kBuTTHqjVIrnPNBvqyfCBtkHkWIbF2PyPzbgkQzzhzqXoj/BDd
	 09e7LTTULhbeeWHGoRuBwnHHG14BX+A653Z4LF7DduwicRboXkF3hB9xcIXx7wZb/u
	 a3cq98cZKuvAXXvUCCIrH09H6QaT/izBd/XjOOC/iPe1a47ntrf3oehkFx9+2sI4G7
	 ikz/x+RwjeI7WonON+zdZMXrLSZHiFsSfo6yBPFOxN3hKDHMpWeaaMyawQ+K7iUTao
	 kgNaz0P736ZozQRQnXrAXcG8jt6mswS3kdWptaE6EkGSsFqaYd+6N2XOROhBsBwR2Q
	 eRyh3v5UFuWTg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH7vwtZ7064397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 15:57:58 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 15:57:58 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 15:57:58 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ping-Ke Shih <pkshih@realtek.com>, <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: Re: [PATCH rtw-next 01/11] wifi: rtw89: coex: add a notify entry for dynamic MLO RF-path switch
In-Reply-To: <20261112060600.71784-2-pkshih@realtek.com>
References: <20261112060600.71784-1-pkshih@realtek.com> <20261112060600.71784-2-pkshih@realtek.com>
Message-ID: <2d9b6d16-f0c7-4a93-ae50-06da68449ef9@RTKEXHMBS05.realtek.com.tw>
Date: Tue, 17 Nov 2026 15:57:58 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Ping-Ke Shih <pkshih@realtek.com> wrote:

> From: Ching-Te Ku <ku920601@realtek.com>
> 
> MLO link combinations such as MLD2L1R_NONMLD let the firmware switch
> the WL RF-path binding at runtime between 2+0, 0+2 and 1+1, instead of
> keeping it fixed for the lifetime of the link. struct
> rtw89_btc_wl_mlo_info already carries mrcx_mode, mrcx_act_hwb_map and
> mrcx_bt_slot_rsp to describe that runtime state, and
> rtw89_fw_h2c_cxdrv_mlo_v2() already forwards them to the firmware, but
> nothing in the driver ever wrote these three fields. _set_bind_info()
> and _set_coex_binding() both read mrcx_act_hwb_map to resolve which
> HW-band a given WL RF-path currently serves while in this mode, and
> with the field always zero they always resolved to the same band,
> regardless of what the firmware actually switched to.
> 
> Add rtw89_btc_ntfy_mrcx_info(), a notify entry a caller can use to push
> the current RF-path switch state into those three fields and let the
> coex engine react to it. Mirroring the driver's existing per-HW-band
> link_mode array, a mode change updates whichever MAC index the active
> HW-band map selects, and a dual-band-MCC link mode is required before
> any change is applied, since the RF-path binding is only ambiguous in
> that state. A dedicated reason code and notify counter are added for
> this entry so it can be told apart from other re-run triggers in coex
> dumps.
> 
> This only adds the coex-internal entry point; nothing in the driver
> calls it yet, since the trigger for a firmware-side RF-path switch
> needs to be wired up from the MLO channel-context code.
> 
> Signed-off-by: Ching-Te Ku <ku920601@realtek.com>
> Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>

11 patch(es) applied to rtw-next branch of rtw.git, thanks.

7d868b6bc647 wifi: rtw89: coex: add a notify entry for dynamic MLO RF-path switch
e3b3a9c1a56c wifi: rtw89: pci: reclaim TXBD before fully draining
894ed2ab89cf wifi: rtw89: 8922d: use efuse bias for CCK RX gain
223a1fbc392d wifi: rtw89: 8922d: set CFR clip threshold while setting channel
476dffb75cfe wifi: rtw89: 8922d: correct thermal trim range to -16~+16 programmed in efuse
a6f038c9753d wifi: rtw89: introduce bitmap of supported bands to deal with quirks
6c0f828b904d wifi: rtw89: get default channel based on supported bands
d747973e3d91 wifi: rtw89: fix band assignment in rtw89_core_update_rx_freq_from_ie()
3c2ae2983e44 wifi: rtw89: Update sequence for MLO link switch
487162d8a9a2 wifi: rtw89: 8922d: enable dynamic antenna gain
fb51e39dfaea wifi: rtw89: phy: fix antenna gain unit in debug output

---
https://github.com/pkshih/rtw.git

