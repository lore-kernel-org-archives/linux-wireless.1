Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557405;
	b=y4xwdg98v+LhEIRqfoNZ1dOPcWvmf6ziHMYtOgBT/QGToF3g4e0h8jIAiY6b4y79Izue
	 4WfAioZ72crJYfntfmXnLfgs+fVLc/Jqxuw+/VRtB60LVZG+5esM3qgbK3VOEQNus0s3r
	 wOBcdAw+RusubPqtQ6yCzSAn5U31ZEI8pMQagyx2kl/+qZNDJm+TYgTH6SgeR9HAD5Qmg
	 NdCHShG5Oj/trUH95JvOQjrRKG+g9uNJ0hm86GJ95SsBemXTsZlGqypI9nknysRwAMuL/
	 R6v+5xrvnsJYBiDv3o7Bq/CBvgewgFmzWhp6kElvS1ZMRUkeT1z6dJQN8hXNNxGecgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557405;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ptOo3l1wVPDxcuGByE9VTRE5C5UcUnRFoideyOy2rR0=;
	b=mOy1bcddM/cbCUe2C56cB9W1JcgEFi/rKvMKODu2F2qtQc2Ct2t5fPzNwAuoDISqeUrn
	 Dba6D0kwGjjWTGNk1ldKAH699Dno343/eGbQ1604L0bUTI7RlNPS1SuogjDM/xMiYItyx
	 W7aMBldg9W4kgXWQx7fC/PeEPdqbEnsHA3toqpeKNL738wSrML76Pg17DTaCjHjNjQItb
	 ECmuo648tHQfqJ3ntV+xFve4EdCVnLyxDGN18RfFBXvayJmFVSoGGyy16NX0EJpAu0GXy
	 WQNe/64cJxdSl6OLhH+BNN93cypprTJ876ySDbFP7G7jLQMZJooCg2w3K8X801Bkc7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BuvMuhBc;
	arc=none smtp.remote-ip=91.218.175.40
Received: from mta0.migadu.com (out-40.mta0.migadu.com [91.218.175.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE80606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE80606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BuvMuhBc
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V1ClGZvD1A+gwzdY9/yZrU4v0vHeluKVV9NtjwpReiQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794557403; v=1; x=1795162203;
 b=BuvMuhBcGEb9Vs/X8TYNh906CXyxZFaSGmTITOBX9PWomdnmACenfzycOJ9IrJlZ39DTTA3a
 rVpKfkgzIv9ZLjfEhG6hucSURLZay5EsuT+G5Ha2jhuunNgy0LbMT8/fPq2VlDmONGvYkQNGwDS
 xYob8lGLesCLMvF/7zaPQEnQ=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3eea5f2ba0d76f47;
	Fri, 13 Nov 2026 08:10:02 +0000
X-Mizu-Trace-ID: 3eea5f2ba0d76f47
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 09:10:01 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_5/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8821a=3A_respect_peer_A-MPDU_size_limits?=
In-Reply-To: <20261112173246.3201729-6-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-6-hjf3108@gmail.com>
Message-ID: <83327241-2EE9-4F4E-8770-4C422D0430B7@linux.dev>
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

Thanks for the patch. One small question below.

On November 12, 2026 6:32:44 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> index c8008cf43d..c8f5cdf31c 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c

[ ... ]

> +static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
> +{
> +     factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
> +
> +     rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
> +                 ((8192 << factor) - 1) | BIT(31));
> +}

What does BIT(31) do here? I see the vendor driver sets it too, so I
think it is right, but a define in reg.h or a short comment would make
it easier to follow. The same goes for rtw8821a_set_ampdu_factor().

Best regards,
Luka Gejak
