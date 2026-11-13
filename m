Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557363;
	b=V4lXdIAwEgiAxieEcmIwUxAxJEo1em+eP6hvhx4MXOTLc8z702GpLfnrnYKJUsMG7mWj
	 rbZQ014zdcXiNJYsAKFiJLAk5zb9wZVtkPC4fUI8LXyBLPQswvD1Y1kXP8Coa5jbSU9uG
	 NiSpsiDpRWTeMwtbz0FUXKjCMpnhoJw0ri5nZ5D3b0+ZzscptRY3xNwGwZQS6oCVXvYQx
	 hmHixs7QJDnVcxbaidoXLkrgzzpMXfowgyT4TAsHKOt/eQz2IKSzQBEniUsYwAmTV5OW9
	 YK6qFK3uENL7nZgT5YSHKw4yjHPpem5Jf++dVHy259QNTSDKQWPNwgEidbypNYdCsMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557363;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sk0AB92kLnOwj/CgVb2bep7o5pcDe4uBG2/l0BJ8l8c=;
	b=JREGelxtaLvso0Pt3sVBYEts7f/uP+8uY18AWnot1BnKpkAN2n/EvFfIcsP0DHXtPQxR
	 iwdaHz4Lb86kocxluyZis4snepMdkR4IH+jUgfq3Cx40rxA4cfFvNL2cQLmRkSDaOt7Zt
	 tjrKZivo0/GJG+K6z1mWZdL3WqdR8E13JvE8F21wUGcGc2MhucGv5uO6LflTwpCmaOJb+
	 2diI1ygy4DB1f2XuNb6aqX5BfbPbfezuTx039Q3CwOh85BfpQRwYd7Rhnl/Znjo9ZcsUx
	 F4T1PNPQN9p1fF3mfG3kJ/AfY5IvehmtiqcClcfra/ffbDfQ+omFO6Fiz2Lbd0Rvb7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rESt4kKT;
	arc=none smtp.remote-ip=95.215.58.54
Received: from mta1.migadu.com (out-54.mta1.migadu.com [95.215.58.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0E9606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A0E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rESt4kKT
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rH/6D6pRH+0kDCz6LBDjjoYzLFCi2gVjnzEh7bny4EE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794557360; v=1; x=1795162160;
 b=rESt4kKTurc6gxqWlRGLU/eRDPHpt+ndYt5Bxw6R901SbCbshusxuYMAUowqU9eIWIl1jkAy
 1SEbHw+OlREYiQudg4rO7z+YyF+/Rgm+7reV/9yUgoMRVpRzvqESU459hZ9f4fPL3NAndTnpV37
 rwGJp/ZyfnlcMOVD4fjDVIRQ=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c189b413d531ac45;
	Fri, 13 Nov 2026 08:09:20 +0000
X-Mizu-Trace-ID: c189b413d531ac45
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 09:09:19 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_2/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?xxa=3A_receive_VHT_SU_beamformed_transmissions?=
In-Reply-To: <20261112173246.3201729-3-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-3-hjf3108@gmail.com>
Message-ID: <19FBDC54-7E87-4A8C-BDD3-E16351EE3CEC@linux.dev>
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

Two more small comments that I missed in my first reply.

On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
> index e35c57c9d1..c2a18f6be8 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c

[ ... ]

> +     rtw_bf_enable_bfee_su(rtwdev, vif, bfee);
> +
> +     rtw_write32_mask(rtwdev, REG_SND_PTCL_CTRL, MASKBYTE1 | MASKBYTE2,
> +                      0x0202);

The other values in this function have defines, but 0x0202 is bare. The
vendor code doesn't name it either, so maybe just a short comment on
what these two bytes do, if you know it.

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> index 5ffa29d181..128a18ee33 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c

[ ... ]

> +     if (rtwdev->efuse.hw_cap.nss == 2) {
> +             rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0);
> +             csi_param = 0x01090109;
> +     } else {
> +             rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0x01081008);
> +             csi_param = 0x01080108;
> +     }

[ ... ]

> +     for (i = 0; i < ARRAY_SIZE(csi_rpt_regs); i++)
> +             rtw_write32(rtwdev, csi_rpt_regs[i], csi_param);

These numbers are hard to follow. As far as I can see csi_param is the
same 16 bit value twice, BFMER0 in the low half and BFMER1 in the high
half, with the layout rtw_bf_enable_bfee_su() builds from named fields:

        csi_param = (u16)((coefficientsize << 10) |
                          (codebookinfo << 8) |
                          (grouping << 6) |
                          (nr_index << 3) |
                          nc_index);

So here codebookinfo and nr_index are 1, and nc_index is nss minus 1.
Maybe build it the same way, or add a comment. For REG_CSI_CONTENT_VALUE
the vendor code has "nc = 2" and "nc = 1" comments next to the two
values, which would already help.

Best regards,
Luka Gejak
