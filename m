Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551258;
	b=oOPb4OTTpY9CQpksWMSxOvIhxxMXEpldKN89363XnShMO/cyl7+rdzDkPst82Modsmcl
	 JpQY8YzTK/MAHhkEeWnnKnE9T58+FdzodPow/KfImm7e2dNAmKpOq6Z2dw5yhkNqVXNrC
	 P6/JaMcsXU0Q50lAqZhWzZYOwrAXBpNtSImrbu7QhxY/RcNxpEe8HEs/wtD04sQjfmj8L
	 unjsNEktkku9S7C5BQcyutg1w17yvRQH0R1Yg7Zfx6qxuBLL9q77jYixG7vRKy3iItUN0
	 tiCNQMLBs64MF5YaL4rK/M07E/vKB8JOPzmOggQnj+qN7Afd36oP7IemgdnBWtbz09g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551258;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gwIwYMpes8uE9YDKwRwuExt98zMj3YPi1Pc/xc57m6w=;
	b=xGOhOdTX75n+G7bdqSX3VL7u1Wfyw5rjjwZ36tTcvGHtyRrEiV/BUdka86InVbpGSdt5
	 XeFlo0NBOkjYBDSlTU44I3NncCTnHCB55XqAi2l9p/XbywZPSgXLiFFwCh2lBdnhpxgxp
	 Q4ON1CMPjQTH/xsAJW15covPzU2Vl6MohvpRuf76A+EvF2PvHoHpnZNA32UrK5b73UtnW
	 SHKAXiGty5OyNlvIurN4P3Vt2Q0zdoQYCIbGWzA1mlqZJdajTEcp7cdJVrM6rj1pXc578
	 qvZIkXMSrhpUaFgy3ICPunTI7ta2CWxHcaEw2nc/LdsIBauHGUXcNQHvmkvzK8cSXDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VW0te0ng;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051EC60A380B
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 051EC60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VW0te0ng
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-3282db206d3so3847514eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551256; x=1796156056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gwIwYMpes8uE9YDKwRwuExt98zMj3YPi1Pc/xc57m6w=;
        b=kFK+WFkddFpeYxdVRVS0iFAc+6utEiteWVDtRuEyP9GJJCiu+PXjsEwUs2xDGnOYB/
         8ssw/EXzoGZxxRYUmeANfaVW4ywjLYls7SiF61u/+NVSA/H3rhlBRztUdHsfYXpMI8iG
         DON1aKcPtFT7m9yrpQ3xmbxxEgtlxw6eLxc1U/+TZLzhV7o7zKG1jDO8bcyMIa0eDmgF
         bHcyw2QzFyqn8GQjTQu8F1UKK/MMMVYz4UNlHwu5644MIERTiEjrKi3VnkNBnpfD3Clk
         h3qZzyH1zMEHiD5tknr16Op6AyCgqH/e5bfp+Z6P4nWPap5UjXFsZ26B5fnjkExiKOGe
         MXmA==
X-Gm-Message-State: APuU4Z9H/fBInXfSmYvqPNzDi3iSaiMQmHgPvQGPXTPeIRBX2Y4WjcoM
	zoOeCmArLfaSO+JDTOwPQXbG0xIIMFgTtWqfKtmqEEOPZF6/MqeQ5LPHi+JkX7HEhOXB0Y+M82E
	bu8RK81vkzMill9t8HXKfsJJ8EJJZFI3b49g5apuD1nPKzSodgDl1bAANQY1eYwDx/JqI1WT+lx
	fS9xdM/EYxp5Ff7lnGIHuYC7TTAvdF7MidYzVf1agy3+xJuJ5WCUHU63uYEw6GqTwtz2YwjrSJb
	RkWdXtW31rpNhpTdlTzBRkd7sRF
X-Gm-Gg: AZFdTZfWP2FdwiEDa8+Ksa1JddvCDxKQaEPdBzThkqNXzgRjoILHQC3+TusCfnHXxj3
	0wl9hAE8/10qBgQC6+0X91Shgxq95rbv9FiZ5WmIMXpQWfuNd3EMtnURRdeWmnRw+v6yNK0We7O
	3JvnqyxsYE+Y2vtugv+vbs3HiRhMXgO3cjp3cbIJ4j+EqtA7fDLZXYZcqDr2u6+aEDNSJ1/LEsD
	mHxEfr3mMZFcze+Fx2InCCH26t1NjkjxmcIOA1PMbI1LeuEA6K1wS/fWqOtTpwnOUd/cDabhPUl
	TMG4UlpxVwS3G5kSgujQZ5YEFHlUFpLCBOSj5/s5xVykxkp9eL0rtT19vpMGbTQBCBJaHHsZAnI
	npiDBer7zF6faAtYy163RRwMfCWXVHeX6bUKpGZQGZk4HG3KtmmdlyL8YhBWkXpyti6bMOL0tIY
	A/uvwFh3X5QRQ6GltDFwtcNtMzwUKyCHTHNS4IPW0=
X-Received: by 2002:a05:7301:4209:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-3857054b988mr17530585eec.39.1795551256011;
        Tue, 24 Nov 2026 12:14:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385679baf51sm2154053eec.22.2026.11.24.12.14.15
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-921273a6cacso73112466d6.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551255; x=1796156055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwIwYMpes8uE9YDKwRwuExt98zMj3YPi1Pc/xc57m6w=;
        b=VW0te0ngU1NTlc0VEeWpVM6IXOi0jxIkODf/MWBveiuoeOzC1mByJjbXv1hYkgjBrY
         zjxxu/OhIDbd/jMFlZhSNnkBPd3Wwnt8XwP4wfdIOPb2a9EUuHse05pTlPQeN7eaJanm
         q8U/YGEsEsPsnCEITjUwL6p95hdkZHWpzdQF8=
X-Received: by 2002:a05:6214:8624:b0:921:1b08:82a3 with SMTP id 6a1803df08f44-92134a7925amr276255436d6.18.1795551254635;
        Tue, 24 Nov 2026 12:14:14 -0800 (PST)
X-Received: by 2002:a05:6214:8624:b0:921:1b08:82a3 with SMTP id 6a1803df08f44-92134a7925amr276254806d6.18.1795551253988;
        Tue, 24 Nov 2026 12:14:13 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:13 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 7/7] wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info
Date: Tue, 24 Nov 2026 21:14:01 +0100
Message-ID: <20261124201402.3499613-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-8-rosenp@gmail.com>
References: <20261111042554.232998-8-rosenp@gmail.com>
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

On Tue, 10 Nov 2026 20:25:54 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The driver only ever has one BSS configuration, and it has the same
> lifetime as struct brcms_c_info. Embed it directly instead of
> allocating it separately, removing one kzalloc()/kfree() pair and its
> OOM error path.
>
> Move the struct brcms_bss_cfg definition, unchanged, above struct
> brcms_c_info so that it is a complete type there.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/main.c        | 48 ++++++-------
>  .../broadcom/brcm80211/brcmsmac/main.h        | 68 +++++++++----------
>  2 files changed, 55 insertions(+), 61 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
