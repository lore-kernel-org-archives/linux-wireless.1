Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.242
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206514;
	b=AtwWMObctUo92Mq+xZhbOpxjovSNrCz6kqVwz4SjRtDy1hABLcxIuyZZIF0Gf4zWulH5
	 wY+Zp+pyGysHUtlSh89WLK/Fj6SVXyIPFOzbt/Q7XlD7GpjrHD64kzXBYGXLWJZ+C1/uB
	 vWqUf0KAd1iWWBOtDBD2iu1s/v1iPtheu+ykv+nmRDT0G6OEm5obwsNT65CTyOtxZFIQc
	 tlIeB5EbDXgEA6EX+oxQD6NtMNWJjm+a1Fdm4QRoe50BAAhuFyjlNIeAwX3xkX0epiWqe
	 5Hrlzr3Y6R4rfmlJhlwQ1+pswhGibj3SPmajSB/HFL4HCxlXeGRfK78V+HQm2HnUJdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206514;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZzG+B6v080Z5FbgsRfwns3KQJ2PJp7hPF1hqKQeiP0I=;
	b=r7FwmH9LtPOHQck9D7hgbUwBh0FISIcajcftFNhNb5m3xS+7Wk6Xx6ctCdRnUjUhwh5k
	 zA+Na8R/q5nslPuUjQ/1bap8WV8yQOxfcrscHotZrV/pA91WZCU7K6xqRsm5dxL6+DYco
	 KcsLVsX3B96TskbnM0xMkaMSFMCRZ8waCEpJezW9E/POEVoEH6YuR01QxOfVahsNO7d+e
	 wjdqXB63a31pMHmierQrjV0OK3h4ijpmoYMNtlaD8pvKKEQVYzzU6P/+Xy3Oc6NqaLlp9
	 ztYEYDDUXoc3Kc6wPeS74bJVAYByPK0mBADL4j6NSPlAlQgD9lr2ft9g47iBK3KKa2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v7F+PgyF;
	arc=none smtp.remote-ip=95.215.58.242
Received: from mta1.migadu.com (out-242.mta1.migadu.com [95.215.58.242])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CADA606A32A
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 06:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CADA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v7F+PgyF
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nox8bTJLykF11nD4yonwkiNc7pDMafIXe+7tPzIa2gA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794206511; v=1; x=1794811311;
 b=v7F+PgyFV/RlIoNzZkTNW/LpuHk+gaaL8XmTOU2rbR7vYbYWxjVgo75l4TUdZKiyvxMmCznH
 N5tsw4GpOwRaDjJ9u9Kv5RaMwwyYqfH9aktHAV/tLPlpzisRb/yqP0yMQ6b9KmMqJQ6ykDGPRSk
 L8dJrMtP8XueB+Z18vLDCVlA=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2938fe24122b836d;
	Mon, 09 Nov 2026 06:41:51 +0000
X-Mizu-Trace-ID: 2938fe24122b836d
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 07:41:46 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
 linux-wireless@vger.kernel.org
CC: linux-kernel@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Kalle Valo <kvalo@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND_rtw-next_v2_1/2=5D_wifi=3A_rtw88?=
 =?US-ASCII?Q?=3A_8822c=3A_fix_out-of-bounds_access_in_cck=5Fpd=5Fset?=
In-Reply-To: <20261108182837.682661-2-zeshanahmednobin@gmail.com>
References: <20261108182837.682661-1-zeshanahmednobin@gmail.com> <20261108182837.682661-2-zeshanahmednobin@gmail.com>
Message-ID: <0FD97102-7E9C-47DA-9B52-7F7A837E2924@linux.dev>
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

Hi Zeshan,

Thanks for the v2. One minor thing.

On November 8, 2026 7:28:36 PM GMT+01:00, Zeshan Ahmed Nobin
<zeshanahmednobin@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> index 09315d23e2c4..6343568285bc 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> @@ -4406,6 +4406,13 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
>       nrx = (u8)rtw_read32_mask(rtwdev, 0x1a2c, 0x60000);
>       bw = (u8)rtw_read32_mask(rtwdev, 0x9b0, 0xc);
>
> +     /*
> +      * cck_pd_lv[] only has entries for 20 and 40 MHz. A chip that stops
> +      * responding on the PCIe bus reads back as all ones, giving bw = 3.
> +      */
> +     if (bw >= ARRAY_SIZE(dm_info->cck_pd_lv))
> +             return;

As far as I can see bw doesn't have to come from the chip here, since
rtw_set_channel() programs the same value it stores in hal. So maybe
this could just be

        bw = rtwdev->hal.current_band_width;

CCK PD only runs on 2.4 GHz, so that seems to always be 20 or 40 MHz and
the check could go. Or is there a reason to read it from the chip that I
missed?


Best regards,
Luka Gejak
