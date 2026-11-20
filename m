Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184158;
	b=C57t0iMzgrHurMMNPd/c6qPSotOUsY/2sH40DSl+HfkCf6cIxM1XpCqroybDc0IqMD0W
	 EZmabYqcmvLcpfCQVa7046g3ySIsyYBVmAb++ljIe8jvp7P5CNk6zPONCPtzXA+irA/xQ
	 bTLrwTIybPO8OtcW4GgmIB0Kj/OFHb9nV4f2agVc4At8n/dbZW579zpINrJow2YflEMRz
	 e1mVUP8lNk969M1CfKplfjMiAxCJCzx1t8a7ZInc3PiwPcLbi2QysN9RcIGbatow4kKGE
	 nEw5tKxK0eHY05Vd6wFDlDnlNJMslo/tce0u8GBfFxyy8fvDOo4rE1PrVQCU9F7aHfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184158;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mFh+dAlIh89UuUDw9mliDsW1ZkhnuL29C/bIIMkCoV0=;
	b=Z5Om/b5sK8ldvWQl0A3hGwdDtidVJ457eUTrk8Zz8kIvoqf06uyk6Mk+rmHh13DLJlIK
	 HgmQc9E/QEwIpYz6okI50bZ/YvbWKHWt0vIr/dHZoOJn6ZGiOYbLKnR37Y1HrL1QuX6Wn
	 unBj4H+O475mXP9qWAngySPlgebcOAl8V6JD/PT3obPdQMidKiVbDDs/ZvisME7kuRf/z
	 TNvEkxx9iezqyN6G6DcfFC/NMm5a+OIeDCoyDXtdYuBlgtogy+TCSGwSqmEimrx4EF97a
	 ZMEb6aEW9RgnlPLWbnsy73w99dJqHsc+Qxr8uju9o21sKL9PFYnjRmTBgrgI38Zdr6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=okxXx9bj;
	arc=none smtp.remote-ip=95.215.58.35
Received: from mta1.migadu.com (out-35.mta1.migadu.com [95.215.58.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8373606A32C
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 14:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8373606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=okxXx9bj
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IxY/RMDxRESNWi5qd2dGR2bSpXOJklWLECvCrSdEVx8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795184156; v=1; x=1795788956;
 b=okxXx9bj/Cnv8Wk9oPUXQ0LPws6YoaC65B4oxmVwOYiCY+gZ2NTWdxjaIzAd0U9whuvyUiNe
 jfAfZLJVy54+HW8lcoeZG5aw0V5pKEIhBhBpyBw2XjtXlk54ftBtuMptZTcS+ov1PBlVw4D3/cF
 H1f8AywxUtwx1FYVOPLakLAQ=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6bc853064f227431;
	Fri, 20 Nov 2026 14:15:55 +0000
X-Mizu-Trace-ID: 6bc853064f227431
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v13 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Fri, 20 Nov 2026 15:15:53 +0100
Message-ID: <20261120141554.68116-2-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118231940.3950-4-mehmet.fide@gmail.com>
References: <20261118231940.3950-1-mehmet.fide@gmail.com> <20261118231940.3950-4-mehmet.fide@gmail.com>
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

Thanks for the v13. One comment below.

On November 19, 2026 12:19:40 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
> index 9d5df3e65b97..c24932d00e14 100644
> --- a/drivers/net/wireless/realtek/rtw88/fw.c
> +++ b/drivers/net/wireless/realtek/rtw88/fw.c

[ ... ]

> +	div_u64_rem(rtw_fw_read_tsf(rtwdev), interval, &rem);
> +	delay = interval - rem;
> +	if (delay < RTW_CSA_TBTT_MARGIN_US)
> +		delay += interval;

[ ... ]

> +				     usecs_to_jiffies(delay +
> +						      RTW_CSA_TBTT_MARGIN_US));

Does the short interval case need a smaller margin here as well?
With a beacon interval of 19 TU and a download that finishes 10 ms
after a TBTT, the next two TBTTs are about 9.5 and 28.9 ms away. This
queues the next step about 38.9 ms later, two beacon intervals away.

Several counts can then go out twice even when the work runs on time.
That seems to put the AP further behind a station that timed its
switch from an earlier count. Could the queue and hold paths use a
margin that fits the beacon interval?

Best regards,
Luka Gejak
