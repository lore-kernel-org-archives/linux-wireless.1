Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794055416;
	b=b5QR6AKFoez67Ls4bQOt/nRUq3Cke7Z6UwRH1YFrAOTMTptKQCig+ruTG8NbLe08qdde
	 dc7aLimepbE3gTP9SFCo8+VXThaXkcRh7scxw3k8zEuMGgm1PCgDBuuDYKDlRsFvw/W8H
	 +OjDquqk9LprWpsJxVTUi6+7FvMbk29Gb4coTyT+lJQc3MMlpvg91LFs3Lc6xtUYi67Qt
	 QhJjeNAY8whYIWLxlfVc7gd9uHg9sHsZfsKMP70Uf2JilnLvB9ELaod9n79BRGiX8WRdA
	 +DvV8YLcl6dnQDjT5IMMlIihARBVmaArowIgYXITon/svIvr7pkUDSH3YcYv7xoSAcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794055416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pDck/GYKkpZddhaxEY+MTJsBRTdKFHotW+rhmCOAAbo=;
	b=Ff6z/MFMoxiZYSJH1sraKDsZspRia2jNDJtSCMypijjnVZvWfjKykBIJjw76nTFI4U/K
	 nfBtay0QWHFd7WOC+WpG31nWkcC5OV1IQseyDAFrT1D7xveas0hwkuEI8YrWy4UCV/hf5
	 Fxev+4CvpunZDIMmLjoUPM3W2hy3FS0Ok6YdsCMO0QjTFMkt5fGyb1GynDNSZRMQtxq2G
	 H5yzguchen51QQCRsTa9+zLfS4avi8THmWGxT9VHJgcBk4bOy+DOZY6lj3dppQgstO0JA
	 tG5Hbj3hRhAiH6vwzywhYLtL5H0e5FD3CyyKV0rrxO7G8GvftyrDDBY6iCueM5THp2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Fm/iTVqJ";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C803C606A326
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 12:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C803C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fm/iTVqJ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36f8cdd30beso224211eec.1
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 04:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794055415; x=1794660215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDck/GYKkpZddhaxEY+MTJsBRTdKFHotW+rhmCOAAbo=;
        b=Fm/iTVqJlZXe1tiUJpT9NJbrbVIyOi94M07pxjEKxCWfDANMelRGow8MRBkIq1b+JD
         EsKPUM8ck1BtTc+8G1SRPG3bUIEj92Z5QRzbBmbVLVNHFaeInUxDWRmHWkAGaw44U+Uz
         NJIOpcuoQSNr6XbudNv7VBVx32WBHo73PtiyXJq5f6Jq6xicnFiSIv8TEd5YtOQUJBON
         jij18vDe44stlGuAoeifPb7EUtRdalFSvJhaw5yz5GA2+sbVpmFX2TGU28XqdrRipVTn
         Tu2ta8SL2GTkDhVRWCp3pTGrD0rw9s7TOGsb2aBjnwdRYKUy9kgGBHaEzcy9dkSVgIpn
         qmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794055415; x=1794660215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDck/GYKkpZddhaxEY+MTJsBRTdKFHotW+rhmCOAAbo=;
        b=goWbwUmr8A7R6zbxAC0Jw1sn4ngSmaxSGd1LnbrccEUws8CZjXgcYl+x3hXMMvJ9aI
         tV4eAi2RXa2ZKWvkxUvnxHGEVj+2nvLGEYv93S7FldxAw2umNsQm1Bfjb6H6ApyufVk2
         dcZP+sFK2d8a/oCGRdxrmMRJo9VwxR0tqkvxjD6F44os79IHwkpCU1rXOfb/VeLIawr4
         lPeKzYSspa594OxTxE40Cq0UmZ/zFVPp4SiEBZJqGCP5+QGaZtVaelu98tYjHuHjAwy8
         wCW7ArLdCMSayWORGXrVkgxpOr99OiE8IavB3wLDlQp7Elvav0iVx37iW2ELMBChhZFw
         852g==
X-Gm-Message-State: APuU4Z8Riow/4ALwEOiF4t7pfrRjDT9MQiYRqAmtOnHUmMjVBFdmQKQB
	Q3LO84cWEm4whW4/bgLuifX99j0UOWg7x/Kk9YXGgvlmDAAk4dSF+oOfhR3MuWbs
X-Gm-Gg: AYBFou0CntMIpibl2q+V75FrpK2/WFzMlIxD3me1xUNV9SO9c09WI3zxgoRjN3utwS9
	GBiTIKbtCbVlkq8+2JHHUaisZ7xLXSwnz/AiQVC1tibsoTNlJdad51drpfkhD2Q2gy/JtuNUZw1
	nBeVe2rCTz/UX3dRI1c21DXBHCRP8ltI7IkOMBzwGqOkZ2xEEnyLQ8kJT0iiivDWZpW0vnHxX7r
	HU4LhJqJ/EJtZV4MWmvrjcVCor4jh6RQvhIrkpJA53ACOqBo3Vh0t9z4ZrqVHmU3UxeNf3T9Uow
	IYZg28g0UeTWO9vcKpOC2O2w7/ptRER/JUaxQZhKYe5bVSLyJKo0lwCYPsfW1ua/4O20YoMAcFj
	1uucWM7ilTC9it80rRn+Ly5o1x2FOziK406XvIkD43LZwzILa6l+JTS/R1RGXXW4vdvEvPVYyIP
	Jfl07D6k5zSgJa+JusgJgJqZWAllAcC/WGeLcUiDiKdhe3KQWFZ7Nlfyw78QukgsoobupsPX/UJ
	prk2EJ1dbXrEn3s2PXGbbOg/A+K94/TiSjbG59JtW5LF8FnUhqZ2NKFAZeBh2N1LtfdNV2TDH89
	jwwtX8oNx2OwDyTJNIxDJ+jnv/6Usgqe2To5nFRsN3iKg5n1SdhvRM0iTsq6ZpcdJvZm1DgybLF
	KJXgBlVGcJHnOWbl7bQ90OQcMaKsCWg==
X-Received: by 2002:a05:7300:de4c:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36f771ffbf3mr8253155eec.27.1794055414845;
        Sat, 07 Nov 2026 04:43:34 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:9:484f:bbd3:a0ce:f30e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fce02csm17014269eec.22.2026.11.07.04.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:43:34 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>
Subject: Re: [PATCH rtw-next] wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
Date: Sat,  7 Nov 2026 18:42:55 +0600
Message-ID: <20261107124255.41144-1-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev>
References: <20261105113415.73184-1-zeshanahmednobin@gmail.com> <f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev>
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

Hi Luka,

Thanks for the review.

> This is a lot of testing data in commit message. Are you sure all of
> it is necessary or maybe big chunk of it can be moved under ---, so
> commit message stays clean?

Agreed. In v2 the commit message is much shorter (the problem, one
trace and the fix), and the test data is below the --- line.

> We do not use this style for comments anymore. Current style is:
>
> /*
>  * text
>  * text
>  */

Will fix in v2.

> The array where nrx seems to matter is rtw8822c_cck_pd_reg[], which only
> has entries for nrx 0 and 1. For 2 and 3 the rows are all zero, so
> rtw8822c_phy_cck_pd_set_reg() gets past its WARN_ON() and does a read
> modify write of register 0x0 with a zero mask, with __ffs(0) in
[...]
> That is not new with this patch. But since nrx is checked anyway, maybe
> check it against the two entries rtw8822c_cck_pd_reg[] has for each bw,
> or drop the nrx part if you want to keep the fix to bw only.

Good catch, you are right. I only have the PCIe card. There a failed
read returns all ones, so nrx = 3 always comes with bw = 3, and the bw
check returns before rtw8822c_phy_cck_pd_set_reg() is reached. I can't
test the USB case.

So I'd like to keep this patch to bw only and drop the nrx part in v2.
The nrx case is worth its own fix. I'm happy to send a separate patch
for it (I could only test it on PCIe by forcing the value, not on a USB
device), unless you'd rather send it yourself since you found it.

Thanks,
Zeshan
