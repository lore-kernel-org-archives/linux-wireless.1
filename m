Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551241;
	b=pQSweO/qdsoQrhiXEAZnFCOOV5VMGmgyxmWbNPnfEnR3JCS0AvbaOYX/smUCAXLr/JAB
	 lTo+YHdb/3RgwnTs0ypurSNxtuiYb32PblrsgqSrG8yTDabOQMSITjV5DX+viThAcEi4A
	 u4hESy6ktlpo8CNZizvoX/25FKmggL2yQztQbtfoEjLe3UNRrgTmQdp9+RBZNSi2uXdWR
	 5ocoYvXejkYdVKJzZJh4tYAHMdiQ04pr0wKIW3kR0lScZqLdwCsbq8xsjPJ+kQOSwbsRy
	 DLCekqWY+nM0hB4661QJ04/7mjY1+NnhhteAKTkdzUKurmaDgmuzgTh/Af6+YAshSNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551241;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Jp63++EtQIRHNWdJg4YxJkwdYNnnCNo4XlfBjBOr4mc=;
	b=jauGrLm2m7cqVKUlXwACCYscgfrqScl1FMxesI70lzIUC0lpmzxewdLBb8CLQONZQroO
	 o18BPbCLvFJKhZaPgSTjWHjxZLvObPmkexAaptVtf1ecKBlZHT8yjI/wePMSV31qOubm4
	 FhpHOBN00UWaDbamZ0/+JlCC3OQ14uj9lqsBaCioP+VdxTZA9H9KhfnDGk2Rz2izRR2zW
	 Q7ge39sOOMlFMieGvBkNE2VvSZTAOjvGIg2QbF/s3k1cm4RL9iiAMgBhl04NkQMAVhakM
	 piN8k3UmRfTOPlDO58SmLDJ9uUjqufJgUPBpCqDslK2Bw6916HaNwDJbCxqk0FLdwlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="OpNNE/2B";
	arc=none smtp.remote-ip=209.85.128.227
Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CBA606A327
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CBA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OpNNE/2B
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-8b4d26094beso45083977b3.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551240; x=1796156040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jp63++EtQIRHNWdJg4YxJkwdYNnnCNo4XlfBjBOr4mc=;
        b=sU0Y9pBcaO0fzODz5sjQcArx2imcxfY4sTWInmUhFFXB4rn8z4ZGWoWvtNDiV+TMOW
         1e/yXmAjbRT2Ml1+9QUCaidC5AGJJNL6Fx8tGvXWfqGLkC5lXVwGLcPTVvPY+fwYW30J
         cwSLqgS6ndiRvyzVzOr4FyXF1tHta5H5pivtFcE3PLhvx437WQZNWGMU462plF4I0Lgf
         G8kKgbSvmQFdyVcuaWUO0ftEPtVLLq9Md4/W6PH4wwFLRla/cHhX55R8UlW8cNRxRLxI
         pYz9o94MQzDdN7egqP9u+P+OKHzHzSHmD6wN4CePup6DjK+SffwAs0+Spf3mRHOpjHM4
         b9CQ==
X-Gm-Message-State: APuU4Z+aYEYv8c4H/4Kn+2Nke6yNdQtnLFVdRAc/ap2xKcP4n4Z4jlue
	Z3XjotcLxajf0lJJtDa8LwJD53ZfBHoTUposSAbpUgGqd5yhvf4MvaEBo9NtfHLdJo2Wjx2jTAz
	ljRh01Cr/BbDV4jZI7Z8N0aA//kQKta45m+qp7yBVVs4hkP4DnkP3lMmHcQ9xSRULBFla2aqS3v
	msRsHyPJoWXjsGFqVsmwwqlhbQE8CQwhOJcZu9fm6/l8vhFOWQO+e6JCocWxiu5xrKwYYp24ZHj
	1wG8ISV+NqXrbWNLCex1TGnxYuE
X-Gm-Gg: AZFdTZcq0I6gqJjyAXbi8NQSbXlYLe1KKwRmoU1orHu/g01zvKSWrjazpgEUOslT7Se
	wXcQox+PP+1aaweX7eAjmrokds5OtbzhMEX+u8l0mUQzA79b3jDC9AWtEmmUHeAhc3NC0DZFP6c
	GWuNMjemw12TwV85ObJAj6g+bGVn/YmZry9k6Hv7ELCs78YDrObeS7yJpZgvdw18XkkVmGRfz3e
	dMYbZVkRVWCMvrape3vJ5P/3scubNh8VBOTIGelKAXZds+/wlTKdd2LWTnVeaKQ7ttv0pPOOz0W
	+WlZO/NEmQ8QbUW6vCBkL+WygLLclkMdMTQuGZLJlUbTJJaf4QkMK3+Ftu+15boS2YUK25Otybv
	0pkHNsB5azmjyPFGBk5ywJWl9O+HIQ9gYVbsRXQP1aJY4eJVP3rbdE94AO4o6Zv44ukHiguDYtF
	Opbm/OeXf+CM99r/xqKjGnvZKK5WxpdxyQHbY9lvTRjA==
X-Received: by 2002:a05:690c:6d89:b0:8ab:4c8f:2844 with SMTP id 00721157ae682-8b5204db37fmr70287827b3.39.1795551239451;
        Tue, 24 Nov 2026 12:13:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b520336efasm979777b3.47.2026.11.24.12.13.58
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536720195ebso82957981cf.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551238; x=1796156038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jp63++EtQIRHNWdJg4YxJkwdYNnnCNo4XlfBjBOr4mc=;
        b=OpNNE/2BchRrdz9FDDWkKh3eOdzGa7fjHIO8McNST670TnnRasXfOtdWwwzDlTBuqQ
         RaGwEhobyJS8y8PDxzXkIpV0Oey8YfaQLbKEl7qMrFpBNvuL3AKsG+zKwa3gWcxoCkyz
         ZULvSiw7nzwQPaZMem8tfONg7JXwXo0tPt8KU=
X-Received: by 2002:a05:622a:1909:b0:55c:a104:ebe2 with SMTP id d75a77b69052e-55d7690eeb1mr297462151cf.9.1795551237799;
        Tue, 24 Nov 2026 12:13:57 -0800 (PST)
X-Received: by 2002:a05:622a:1909:b0:55c:a104:ebe2 with SMTP id d75a77b69052e-55d7690eeb1mr297461581cf.9.1795551237281;
        Tue, 24 Nov 2026 12:13:57 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78812968sm136149711cf.9.2026.11.24.12.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:56 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: Fix potential use-after-free on monitor registration failure
Date: Tue, 24 Nov 2026 21:13:54 +0100
Message-ID: <20261124201354.3496134-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116-c29ba55625-wifi-brcmfmac@mail.sdu.edu.cn>
References: <20261116-c29ba55625-wifi-brcmfmac@mail.sdu.edu.cn>
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

On Mon, 16 Nov 2026 22:13:24 +0800, Guangshuo Li <liguangshuo@mail.sdu.edu.cn> wrote:
> A failed netdevice registration can invoke priv_destructor while
> cfg80211_register_netdevice() still needs the wireless_dev embedded in
> the vif. The caller also frees the vif on this error path.
>
> Install the destructor only after registration succeeds, as done for
> regular interfaces, and leave failed registration cleanup to the caller.
>
> This issue was found by our static analysis tool under development.
> Fixes: 20f2c5fa3af0 ("brcmfmac: add initial support for monitor mode")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
