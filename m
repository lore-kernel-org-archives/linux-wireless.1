Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676861;
	b=SaGAJyR+UBWnsAFLVvAg4sl1pgHEH7ozJHj40qUf20nQbBALq/LUcgOW/ygCoKV8c0sT
	 Tl8obSdfkrMD/gFKr8wB3NdBoOgnS9JtqGJV0r+bQshortCBKz/3eKlyNsWmHoPtzMcfr
	 cBcwMEaID/ZGzGvalsa7uCE4FG6uzxYLm0Tb8lYlVtOC6sKl7Izg7z/Wc9qRWzaGMRnxt
	 eD6zaZgyvOd1C87rPSCjQIrpS6pHWrw7T4WzRwOqfXDGIFnOP/J3cPAvQ40XhyghaRVjx
	 56/vzCSWFh6+w6KmDvj+ZxlwVIglQGAwn/sAxaSfh7v2JHZ0QjHjqDLq/ef+A6zDCfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=;
	b=vfOEoC4YI3OZqi7P4jG+yRwIHdTgBcat+apUNFBYnAqBg0pKE/xYOFkjQZZ6jywXy6Jh
	 HNEDt6IczB0m9LFACMo8tyPsT3z8jTwrYYp6/9PCwfwFbDIctB0Yuc/yODksyE6FCY2rz
	 82Y70IoeVtMrwWTxA7BL9p4houxlfJrehh8R4ZqoeTFwBPmKbva76wxtO6Wt4Coh8lB5y
	 dVTo/xHmbQc4uQJAaB6zDDHfNgnKFeA8UJGGLRT35Ta1/OAIfn0fEVM3OiuavOM4cOoxX
	 65olkzRLo6lzTmdQ1gs5m8KOIRwOQIYgZpRZip3vPu3wASK42SRDHYjVdA2wgb+Rk/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=L9Y7t1b2;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1426F606A327
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 17:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1426F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=L9Y7t1b2
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so2803912a12.2
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 09:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794676859; x=1795281659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=;
        b=L9Y7t1b26tvL/YAVend1GF3/zvElMG3l8cU7K95rtjReKXX8XhEjtZn9omgTomTz0E
         yq0/43JC18sP43LqxQ/xT4GbuGuKhNDlXeWgRAFFxuZva4+XzYKhyb949ZDKsmwsUc2H
         60lW7s3apY+R5aT1BhUIHvwlZXrGeoVpGjstCmVsNVKg9BPpFgjs0cLHemRRqwejXLdR
         q1zNeVpxwBX6NovdXkTfrGl/os0AuIgrpLXSnf5ipKgkmLNUOKOfR/wWAkMlBFrRRFui
         uAh8HdWV89urxxb9ZKZ1b7vGPBn0wQVIT3GQjrqQoPigPvqW4O2X7ZzoCoolNT05iRVZ
         aO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676859; x=1795281659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=;
        b=kqsB14c6EeRaUGeTqtycJm8fz2C+HoBL3OG3tNbITFJfaMYG9wo8+Ul4Nmmqy0vlgv
         /Sk9hPHdp3g+3MzG5w5xLR2gFMqLa0Ppp/RiQjrXQoj3zJOvxyW71KAVP4izTG1JpRQU
         RZC2zWxsD/ZuQyW/tyCncpKtgyoI62gPYfFG45V61bgvBpJARwamiOT/MT4eAn9GEO+w
         cl2qKDpoKIWJBPomTKVy6dOgk7a0XHV0flrPc/36Bs2UWNSnGLc548zWWFs9Xvgjl7b7
         jTUoKQSSSDufVcc5NzPjJMlMj4FGTnvaSNgJQgO7ODslGmDcpl4j0+hul0+JjtFdldy2
         nrtw==
X-Forwarded-Encrypted: i=1; AL+hErEharTcD325n22mcvRHZ7E3ulc+oBxzj4BfA3SgjOFONxZidII4yo4OBK2JV+kG3Oyc1AXi2Uxqz7fDGrkXkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lfQGIy9zBr1ETX3Jb9uADCKJzMteenCdax8Yso7hKSE58xl9j
	tcrgo/OnZJ92ppO071mk58aDsfOwmHt4Vr5Hn0/II3RxmnVDjj+FzTCghiS+KB5Jgw==
X-Gm-Gg: AYBFou2wiMBpBamDX7GT0ZWYrA+qeh0Hy+EtvSi1ni7ZbHgQ6se6TXSzmtAf4u0YNXm
	ubSWxlqtp1YRP4vlOB9JfILJIDzG+95J0y5StNDKE6KgGae0OlkbM0GQibvtFmxvc+RGf8dqlNO
	5iIeegNgr5HU/gl6bb1XUt8FoHWX7pDNOUU+zW/QEBrJ6G1vbz3lPunb3gfRBpRJnYHL2xUrZsl
	X181DG5yM3Vk8t0F4JqU0aHFm3VcnPy/recGK2LRpSzb8KeDDHxbONNHS9DijT3CrOKEz5sWg9L
	VVRajOdcrvGDL4+TItcrxepwyYU0eSrfaq5zxjcAUiv+asqlwAh8ujrsUUX7pMDT0E3ig0cUDf4
	ZxdcEvHs/SMc/8DK4QZ51KTVidfOkTe2CAdflRwwCCt5F3URa42PFWMWakqMa0j2ObFlqQKeukB
	VOIFZ25Buzy2FiNcUPyxfofVbmQBgGGVjftpYwX7cIog4mi5Ot3/Pxtip8LZpjvQhgjmbWStC3L
	IpwonPssODv6NXz4aFIChj/Rqwx/Bj75huKZB/0Xh+ycU/nGliBMReX/ZuHZ08egvgXQwEy4zr6
	V73/JqinC3E7P02S8PjX+CK9UcjnTmWGpAMn94TexyZHPrL3uuaSLbiQwwKzDZKV3MmFtRf7F/H
	2JztWdGLEfS2uY7nHEtEm1zqJdk46PVndJqCgPuPsQTenGEwKEgFC3U46oI7k88PlrFUBRNixXZ
	Whb07QgDID9Rmne0lOMfWBrigV68ntnSkEnvyGXIQC+rSHgvk9+84+0jaguW/0YFEw/t4rPpdyr
	3NK1x61BophRrGRibVXYoUU3jO7e/aFD+xzone9Sq6ny86L16SReCHNNmwkxzYHJp4mIdWbeDxm
	Eovs
X-Received: by 2002:a05:6402:320a:b0:6b5:6546:f7f2 with SMTP id 4fb4d7f45d1cf-6b7c0d144demr4458124a12.37.1794676859188;
        Sat, 14 Nov 2026 09:20:59 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1a08sm2462848a12.5.2026.11.14.09.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:20:58 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jeff.johnson@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	manikanta.pubbisetty@oss.qualcomm.com,
	kvalo@kernel.org,
	sriram.ramachandran@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too short for the Michael MIC
Date: Sat, 14 Nov 2026 18:20:56 +0100
Message-ID: <20261114172056.678298-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
References: <20261111080620.244164-1-julius@bairaktaris.de> <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
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

On Thu, 12 Nov 2026 10:40:50 -0800, Jeff Johnson wrote:
> Is this a theoretical change or are you able to have firmware pass too short
> frames to the host?

Not shown on hardware yet. The overflow is in the host code and a
harness that runs the driver's MIC path under ASan hits it, but whether
the firmware hands such a fragment pair to the host is the open part.

I'll measure it on an IPQ8074 with ath11k. That needs a USB adapter
that can inject raw TKIP fragments, which I'm buying now. I'll reply
with the capture and dmesg either way; if the firmware drops the frame
before the host sees it, I'll withdraw the series.

Julius
