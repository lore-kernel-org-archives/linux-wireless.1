Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557323;
	b=xXW7fxBAByeDs1ib0dLkoy+mo4JkJRJA6lxQp9RBHW9KsKlFWCwA0NLc1aMyoBnugPaw
	 yGo9r+8m04CANHRb8/aC55h5xa3ktEr56nbk0inI3S9Y/oj0j2sArymenOLrt3zb0ThQc
	 X7FzBa8CpuAgxGkuknw5VXr9TiQLUYTKSQbD6Pqo6KCHRS1p6usoZQlTpH70nTCZ85ovM
	 1mzbH0XhR/tlBk5CJIh0K1LuUD1ALqwOUF84pye47VTZQyCHVBv5QdTLaofZmlBja9k5v
	 IhnT3jHZCgHZkWpwHh2eHJO2yA/zR5iXQ07uaLV4p8dkdJjn2ongil4pjbuBpAtxXVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557323;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1Y2cQB3BVXv6mmYBPxoBD+Yr8Vd+mIrf0QBlAR5e7vw=;
	b=A1V1h9D58FZdKCBG3ad5BNfUGc9plBl+kSmMGQn0InmMA4O61sjvAE3KtaazvGLMjNoY
	 CgxuiT1b06qHrAC4mo+s6uuvAzj9LiP09XD26rdL2TkG2zAYLI2rQz8Rujj1xbq0cDaEi
	 oSKNP+bunVAuF5OB0E4D+ql0DULAQ4gnXK4gO2g2hQXzD+GoGNDaMOxWT5y22tEVGFS7I
	 yCHrLjhWuIi4iSbtHROUzw6Se+I4d3PCb29JI9nuLgJuMmBqyoKUxqDVu/DlSuuEDkdRN
	 X+oGV4BnG0sva4pJg12ibFYST49KmNcAit/OEARRvUdHkf2B+rXTUP1vNfZRwXCUSBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L8Tuuz43;
	arc=none smtp.remote-ip=91.218.175.4
Received: from mta0.migadu.com (out-4.mta0.migadu.com [91.218.175.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C8F606A32A
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C8F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L8Tuuz43
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U0ANUG2udK2hGqFK0evotqu0SJAXMSB+359C0HtCWDw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794557320; v=1; x=1795162120;
 b=L8Tuuz4378qEOmTr14r9l1ahaZvogPtVsZdB5kOH7FPRIyd9CoJBtxxDF4DQMgIvx+eVbaoL
 bIsENcyqtDvGpXQGSqX4i8KzoqM7bGXdaW9p0+jsWIrxbsYmSqsl+WAVzlMODVoiT8ch7rZBX7R
 zS9G99Ri3JcDrmSMGRqeem7U=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c75314dfffcc5fc6;
	Fri, 13 Nov 2026 08:08:40 +0000
X-Mizu-Trace-ID: c75314dfffcc5fc6
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 09:08:35 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_1/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8814a=3A_enable_STBC_for_HT_transmissions?=
In-Reply-To: <20261112173246.3201729-2-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-2-hjf3108@gmail.com>
Message-ID: <5B401960-03A0-4433-9607-ED5149E31844@linux.dev>
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

Thanks for adding the 8822c note. One question below.

On November 12, 2026 6:32:40 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> 8812a and 8814a support STBC, enable it.

The hardware seems to support it. The vendor driver reports TX STBC for
both chips unless they are 1T1R or 1T2R. But it keeps HT STBC TX off by
default, os_dep/linux/os_intfs.c in the 8812au driver has

        int rtw_stbc_cap = 0x13;

and rtw_ht_use_default_setting() only enables HT STBC TX for BIT5, which
is not set there. VHT STBC TX (BIT1) is on. In rtw88 only 8822c has it,
from 81a68a1424ba ("rtw88: 8822c: add tx stbc support under HT mode"),
while 8822b stays off although it is 2T2R as well.

As far as I can see, a VHT peer already gets STBC through the VHT TX
STBC capability we advertise for rf_path_num > 1, so this patch only
changes HT peers, for example any AP on 2.4 GHz, where we don't
advertise VHT. Did you test it there or with an HT only AP? The numbers
in the cover letter would only show this patch if the test was done
that way.

Best regards,
Luka Gejak
