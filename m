Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551214;
	b=Sml7EgzlB4PMoVysAeqT+JZPl9chOhxykcGNeeWsEhHz82VOLnh34vUltEfdBibmViNs
	 91rkKiTQA6nn4yJs5xP/Di5DvIocixdFs9DV6gq28TlfUR2C5I6qvUnwrvKv+7+A3P2fC
	 omZdltKSyfKnheDVgvuyxMJBh+tIazudM6IYsSMmYXevWkIf2BADc1DGK9wsHi4V2L4rW
	 2zVmwYS+ncNnC9rCvH+s/uL0AMvHeCMk8hKgjhRXvlzyySJj1M90WbZG3BwI8rgMO4bcG
	 3vo4uGW1JfN1MqTS6m/b2q5JMeVcW4Q+RkNZbdlSgsP1MlxrwpgjkvEwi80YdXcxTSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551214;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=0BBHhcvcX0NmOlb5zn8lXYG+5JCH/df9UZnJ1qUIA4A=;
	b=cWHw0ZApxlcnQkSIIYFGxgORjR3wkHOYZrRfG7twZV+3fb6+9ebS3WUMVbOHX/0MyN8v
	 cT+tpEqZeQHJvUWUZyLpIkzkmrzTNa7wyoGvodBx8VLLD6df9V9ot6bOwKWtUxgB+7qA2
	 GyBo605RBO2lx2thPQLADZ5J/J11brr5ESodhwgkq+iVMYYsFNalfvsAsBzW0dNoZz2vh
	 iB/3LZYVTd1KAPoRtbBS5TxZUSNHn3O/QWhVZDammD24yWReqzXhRZOlnE/6+CxtN/yDt
	 Zo7FmGu3QEyQ5RNGSfjtKwZFG73ln/bg+jTjO+j8ZrIb87Z0Z2qi0HKU1GDn6F8CJhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iPER3Nu4;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D88E606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D88E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iPER3Nu4
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2296132a12.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551213; x=1796156013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BBHhcvcX0NmOlb5zn8lXYG+5JCH/df9UZnJ1qUIA4A=;
        b=LvaeUneKUhf13h0sdBMx3t9bv7/HO+f9R+InWAxJdPL5qZeP0lFIgE28/3kYk1aslG
         QjeSyxXeVwntgv61KtGZJHs7s6JvE3OcvooFwGxMQjhcwprpfntdBlSx9fDOnlG8e3GX
         Aho+gIgWRgah0mq1Ljpeg+4MJYiZk+NsxmjWJge0fmtwscUyrLoYRa5UkFTfw+oBL96O
         5QEtTxHL44eFLMcrVziN2WCNmOtvpLmPFKMrMYLqfITVL6lquMVKN4E+KI1mVeaXHV+5
         t5Dl/773J7IfY5JZJXO3Qm10G8fkkG8gwarPvFNg4yEUGP1FwlaypXGm2vl+904TXB0s
         a+0g==
X-Forwarded-Encrypted: i=1; AL+hErG2v1xG52043aszEEIs+tm6Dh2B0nKMXmTz+D5jFT81ANPEtQMQA0D34Pkl9S/33BrukffQFirLoGih+NAUdg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/MajswVtg2JsuE9C5T9o+U54scSVE1nz3xXfBCHyD8/GDniR0y
	6UP2gYLzCodXxeX/xCE0p3aQl/RjSruyq1dWY16O2SK7SxSUVusMIPdLNucCtpSc9fjVonI2dQ3
	mi8pZ4Cz/pJOi6ljBlAbYDJbZnDOVz8HThG9/a5jGiB4oEsREoHRlweNn8vn2WYkHiZr86HOb+E
	FLCoxEH/t1oiwQ+88fNYYvMjXKaBuCcMrRPpGhM25eOKCNlp8dlPRoaHHOsQFiOhnq0bd0qth3+
	OVm+jHcvRNOnqoj4LQZRlykXA==
X-Gm-Gg: AZFdTZdYXKx5JrKuSzlODSK3Ggsar8wxOzt2WzIYZR4Al5SIFrd35XbtvszlIfNtUUE
	3mc+Vc5jgV+OIfQs9mabFDZlX8ZtEuR3e7MHIjIPk7FW5Uyb/a6SDLxfltHFacb9G1RC1aTOZUz
	xhUUV3G96xuRIs1yVw1F2tF1uHPKz914ZCyDbhdbjsLvY+BhiDg0z0uXyoRBMIa2P7TYzq9n74L
	0SPe/ChajmaiXlLVBvIVYPVbgc+sY+zUkgXz4p9kV1A8NK+QixgTiqnKgXSpSMu0K7beXA4nY6k
	e5odS88SCczeecTiahglMGeC8sKE1cCg0qXxSOIEVjcR7w4Ttqq5Sqpk04VrkJg+vGcP7b8I2KK
	WrdoIwTyjT/ESNif4FNu8lmjXXzuQM6aGKuQ7s6pFLmwzNGOKA/zXwE9Aq7GizpFUsLp4/gmvkk
	s6Okl7WS3A+v1C06hdjARf4BZSiFr+aYvGsTEC/Ag=
X-Received: by 2002:a17:90b:4a47:b0:3b3:fc1f:a5c4 with SMTP id 98e67ed59e1d1-3b41c8dc821mr14673130a91.20.1795551212690;
        Tue, 24 Nov 2026 12:13:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4ddf8baaesm1285997a91.4.2026.11.24.12.13.32
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960131b4eso32803485a.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551211; x=1796156011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BBHhcvcX0NmOlb5zn8lXYG+5JCH/df9UZnJ1qUIA4A=;
        b=iPER3Nu4r5LT6OZnZ6QsyFZ5zgc0WpUwgxprR8WKSlU7h9ggDx3fozfUwIWdjoqza8
         3zlpPqddV5ACbN3iwC3eq0Vuk0XeqqY8XhpW5cGm05sKAg30VyElaJnhAOrzGajBlaje
         ten1Jz0hfaQg6pxKOjcD7f43RO6BN3m8pNsVM=
X-Forwarded-Encrypted: i=1; AL+hErEaHbKZSxJga1JxyaruWgdhRVfVNI3bP8DVyJp668nJgaWf66+gWp3vzmC7oc2Y2dNjFiXExwtIZMHGyoElDA==@vger.kernel.org
X-Received: by 2002:a05:620a:4625:b0:949:6d95:f63c with SMTP id af79cd13be357-949bab4d95dmr2635395485a.56.1795551211462;
        Tue, 24 Nov 2026 12:13:31 -0800 (PST)
X-Received: by 2002:a05:620a:4625:b0:949:6d95:f63c with SMTP id af79cd13be357-949bab4d95dmr2635390885a.56.1795551211025;
        Tue, 24 Nov 2026 12:13:31 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac1esm1127270385a.15.2026.11.24.12.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:30 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Shirong Zhao <shxzhaosr@163.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] wifi: brcmfmac: drop glom superframe on header parse failure
Date: Tue, 24 Nov 2026 21:13:27 +0100
Message-ID: <20261124201327.3491419-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116041534.24-1-shxzhaosr@163.com>
References: <20261116041534.24-1-shxzhaosr@163.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 16 Nov 2026 12:15:34 +0800, Shirong Zhao <shxzhaosr@163.com> wrote:
> brcmf_sdio_rxglom() uses rd_new.len_nxtfrm and rd_new.dat_offset
> right after the superframe brcmf_sdio_hdparse() without checking
> errcode.  On parse failure those fields are either uninitialized
> (the early -ENODATA/-EIO/-EPROTO returns) or hold a rejected value
> (the -ENXIO bad-offset return), so bus->cur_read.len gets garbage
> and skb_pull() runs with a garbage length.
>
> Check errcode first and drop the superframe with the same cleanup
> used for a bad subframe below.
>
> Fixes: 9d7d6f95bda1 ("brcmfmac: streamline header parse code of sdio glom read")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
