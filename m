Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641272;
	b=bKISHvKZDPGK+iZ9wegPeQXV+dqEU054rjaat9NWNh+8QwvmHSG527WygVJ4w/i0oQiK
	 eOzJXfXtsW9jw2GSkcENBl68W3pbFoXfNE0HHbHaXRXNhG6UMnriVEfrKl+RoUDTawXp4
	 bPXgZj3AQYv0L9Ff+RtOi4+pw8tP2ebbdxwZ3MEqENYNX736AXVPxn1QKJOwuhoxefALY
	 EHl1x52lz6ha0EKZN6wTrCDpZW8mvtdVP2h5amSKDkoV2+bPqgWL4H/4vU3G66bBzCz6B
	 ObBYW7ylt98hylmi7AXRn496GpPQKWoyLhRmqx8SskEMyWQaBx2gkVtweCe48ow+c2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641272;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zUMdJPi51RnBiU2zfEycf5XIIbWugmRYe7gtZhzzZm8=;
	b=o+Bbcv5B5GVbizsHXuj6Oo/+ehSLp+SvDGvbcrOGV91TLMCUklcNtKGrjmLhstM8Wn0V
	 Gx5A2JGMjIG53m121doNZxTThBGCcJKpcszXNAKwvrvhhgDjoAJ0B5IChOYV4umavcx5E
	 WKwxB5rJmmuKLj+WagcFYnwn5ro70TYa685hCRW5eXhOwzULpPcfrqvdt444Gca756ag2
	 3EU+iHpS4GZAmAlJ+nhb8TB7uPZZcFcoif9tKgi9qqhOwdsSxyvdBrBr22VrQgLNn7lnQ
	 EUxJ40Mz++jsKHnAUGvN0zPu3iOfh9whSPX+GQwldJHDLIK5za3LvcIElAqwfsTcSaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C7Je3Wnu;
	arc=none smtp.remote-ip=91.218.175.34
Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCD0606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 21:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCD0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C7Je3Wnu
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RKZsk0NS8mynIgA4hnJhFwJTH5k76SHJsDIZ2nxGxXM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795641269; v=1; x=1796246069;
 b=C7Je3WnuHE8Y98SHkwZUrfJKYUnfOZXeMYoLAHGwJjkK6v06khzmmSQGEyrGc0SgVvvbQr6+
 AX62rDUhwYSgtQ5HJQtnqfU+COlq9tW4nolsWe3/Jn7mQRkenYlULE6RFvA9y2e63uP0CpLEbew
 o1G+SuUxx86FHzaE4cEuT7MY=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 125b1af2ac55a052;
	Wed, 25 Nov 2026 21:14:28 +0000
X-Mizu-Trace-ID: 125b1af2ac55a052
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 22:14:25 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
 linux-wireless@vger.kernel.org
CC: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4=5D_wifi=3A_rtw88=3A_8822?=
 =?US-ASCII?Q?c=3A_validate_bw_and_nrx_read_from_registers?=
In-Reply-To: <20261125203753.428868-1-zeshanahmednobin@gmail.com>
References: <20261125203753.428868-1-zeshanahmednobin@gmail.com>
Message-ID: <E6ECB3B5-5DEE-49A5-BDDC-0F20CE84065F@linux.dev>
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

On November 25, 2026 9:37:53 PM GMT+01:00, Zeshan Ahmed Nobin
<zeshanahmednobin@gmail.com> wrote:
>rtw8822c_phy_cck_pd_set() reads nrx and bw from the chip with
>rtw_read32_mask() and uses them as indexes into dm_info->cck_pd_lv[][]
>and rtw8822c_cck_pd_reg[][].
>
>When the chip stops responding on the PCIe bus, register reads return
>all ones, so bw and nrx both become 3. bw = 3 is past the end of both
>arrays.  When the chip stopped responding on Ubuntu's 7.0.0-43 kernel,
>UBSAN reported:
>
>  UBSAN: array-index-out-of-bounds in .../rtw88/rtw8822c.c:4407:21
>  index 3 is out of range for type 'u8 [2][4]'
>  Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
>  Call Trace:
>   rtw8822c_phy_cck_pd_set+0x33c/0x510 [rtw88_8822c]
>   rtw_phy_dynamic_mechanism+0x310/0x330 [rtw88_core]
>   rtw_watch_dog_work+0x217/0x330 [rtw88_core]
>
>nrx = 3 fits in cck_pd_lv[][], but rtw8822c_cck_pd_reg[][] only has
>registers for nrx 0 and 1. The entry for nrx 3 is empty: register 0,
>mask 0. If bw is valid and the level changes, the driver uses that
>empty entry. rtw_read32_mask() then shifts by __ffs(0), which is
>undefined; in a test that faked only nrx 3, UBSAN reported "shift
>exponent 64 is too large".
>
>Return early if bw or nrx is out of range, before either is used as
>an index.
>
>Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
>Reported-by: Luka Gejak <luka.gejak@linux.dev>
>Closes: https://lore.kernel.org/linux-wireless/f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev/
>Cc: stable@vger.kernel.org
>Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
