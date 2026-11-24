Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551230;
	b=p6xv4DcmvAjoPZ3s7tCrGhkcPL6qNAoEQINAtKOJBVKibmnVm554M5fW/mQmny2mj7q7
	 uf9Bh3fXjJotWxxnYNzZvopg6OGQOZk5IHgUcBH5nmlK6lxdqXExJzSFtfcUqb7qeFii1
	 sLHpEWrON91qEFVO5Myb6Ru9KeOuAgCpUbiYBl+qRkzJhgCJd8afMCdYE+5qydYwbwwl5
	 7iJE5eqo7nvGkah+HxQTPnZrjGIrY3M6TDUaEb3ybN29r8TYaAwRh5xAiQnpHhmqp9/1J
	 f4TK0aGrOZ4M56cSq2GYRrO26O8wL+QCSan2iMLNUb6aoy5GF4+yGG4gT3CWil0/pTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551230;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rlWIHX9NSm3ZvbB1YngE7yXcr1uevNuXKUdmXs9oPKQ=;
	b=1+KtiANw5YTkVctUXmJsHJNJhuRjMhRh3BoPkHlLnR1FCWeCcRdFKEIDiilILFguvKIv
	 JVd2RHhFYq2Gr9VmNBo8oYONEA1OZFl7OA7o/wPtzR9ChoT0j4dOvf1U4FKkHGDrs9ngr
	 We8Ae/VSOTZcjSCNFGUPLwAlhyKhk1KS7VWsC0Cak+RC+e9BT5A3uirKHkXoOVAPyA7BV
	 AX3bMygtPB5JqItbAwOVlOf+U+w44YNiqkCVsg4lUr3hPi84SH/RUjIg2Ksfhuw4miJ4Z
	 nLQELv/NT/sMTH2kxCE7C7JUnCdw51D4TR11cQ5/6dQhBikjZL6GLiE62uadL4mwqzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="M7HGd/3T";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54348606A6AB
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54348606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M7HGd/3T
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso2228112a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551230; x=1796156030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlWIHX9NSm3ZvbB1YngE7yXcr1uevNuXKUdmXs9oPKQ=;
        b=KMQJlUCiFXtMWyy/bhcZmb+VgHneQKxXwsjKdY6a9+pKdi851JHSue+i5GyV8bZP9m
         p77N4SU3A4inBG9oD2e8CVLZZ0ESrDjqnx/gYRkdeGpJ8X1bGXdvEbU5YyvNVgXwNgmU
         9ipx3UyI1iperp2WQygWUyj9VxGvDGpAMcIr2ZjHySG7nS3fw/m2AqE5fTjIVYS0thI9
         Zf3d1/Jqd+1+MOWFhAmoYsIae2he4D31AqekaWd4asZfAEQWndEYk017CLkMMILSoq/I
         pNUPry8IJ3/vtOqcI9clIU4LQI1blGerwQsH7UI9UW+FD9uU7DutKhpnJWInIRAoS6Dm
         7Lzw==
X-Forwarded-Encrypted: i=1; AL+hErH3sb5YiOgcGdJ5AivXED6cjZtWEPYERySPpOSQjljY2sK5UU7vG6VysC5quwVUriCKn4PWFPZYzq6qN9bpmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9OVbEZrAe58KMfFuZIdFCYlEoJetqQsfjY2qSatP84qvUSlsbE
	3HLPc0z67difr0ZRfV8pArlOAuHfhhiCyNP6Ft/lO+Isck2stt26CVloZOFFDiSaa1Nj0RD23Wt
	3oiMa4a1aEhdmAsTvZR6HbLVHBiXEmDVkkk4YfWrS0qxodRAIJwQ+/mCmDLFkUgGma56gJ/B6s0
	pgYHr+2ZRCrNl32d+i/84z4Zym5udDEe2AMvFfJvdWa+D1XavH/xacj+NTtODsr7eQTjf4EXfH1
	qjEhrrSnZu97U9OsXY3YuGBqjdA
X-Gm-Gg: AZFdTZe8awaY1+lVZlwM5mOEowjqqktnPFGuEXX8H5v/2tcKsnz+qdye7tpJFfVNPVJ
	Q5tvDdMVpFshuPfnObBjK+qOImRlRLnB5WDrt9acvLQCj3hERoTwsgDQz8EEyTagqblZmsLKSup
	CNywKXntb3EYsCeIH5IiEvXUcxQTe3gpjQGSy6pUTn8NUVhcsvICwMIC1PmsfS6tGg67VYOoJzA
	rnFhL372KNp88IVSpnAroe93ykMg9RR583KzGSu9S7TPEwn0JxCIDfNQg0cYCzk8u5bxeIoYNIj
	LOPcuKaifZQSzFYhTcTqEX0QkLibaiOfXgmuCGy3yd4nKmRYKt6feHt0oYzRuXNWVx9cPri1PsZ
	eofcWM25ZhP7JNiyZeRUwrr4nZmStsu7jP+H9utQefXrqPy/IadpqWCeYCF+YSXopPfnB8IaIiO
	nSZeC8Pnq+V63MlZHXURuINvbIgS7CmEJbzmhvSNfvIQ==
X-Received: by 2002:a17:90b:3e81:b0:3b0:a9de:9884 with SMTP id 98e67ed59e1d1-3b41c92a389mr12761485a91.40.1795551229708;
        Tue, 24 Nov 2026 12:13:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfc74bcsm5161208a91.0.2026.11.24.12.13.49
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2d7d7608dso3094469137.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551228; x=1796156028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlWIHX9NSm3ZvbB1YngE7yXcr1uevNuXKUdmXs9oPKQ=;
        b=M7HGd/3TpBUGPZ1clDzQQjzBjwjIe6K59CWkQ19W7DcpRKGoYxib6Nw4UvURpwY46W
         P7RQLVK3DQThTzGVosGY8a2qKmfAgLpYza7ErvdKnxU6jZNGbqNoS7QddvvuVhky7fYq
         VtV3S41abudzT03vJbRYSr3XM9eemBqp2m7Qk=
X-Forwarded-Encrypted: i=1; AL+hErFRfaJoGb+G4rQUjNUmL3UZ0uQHbgJE4cQEf3OgS7PeblqU1OGEzbzZeOAE7sXCLJtCT7SozFYo/rRZj0IZMg==@vger.kernel.org
X-Received: by 2002:a05:6102:f97:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d7396157a3mr7708533137.36.1795551228581;
        Tue, 24 Nov 2026 12:13:48 -0800 (PST)
X-Received: by 2002:a05:6102:f97:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d7396157a3mr7708490137.36.1795551228151;
        Tue, 24 Nov 2026 12:13:48 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm140905426d6.1.2026.11.24.12.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:47 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: brcmfmac: fwsignal: bound the AMPDU reorder indices
Date: Tue, 24 Nov 2026 21:13:43 +0100
Message-ID: <20261124201344.3494326-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115185843.64633-2-maoyixie.tju@gmail.com>
References: <20261115185843.64633-2-maoyixie.tju@gmail.com>
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

On Mon, 16 Nov 2026 02:58:42 +0800, Maoyi Xie <maoyixie.tju@gmail.com> wrote:
> brcmf_fws_rxreorder() allocates max_idx + 1 slots when a reorder flow
> starts. It then uses the indices of each frame without a check.
>
> 	rfi->pktslots[rfi->cur_idx] = pkt;
>
> A cur_idx above the allocated maximum makes the driver write and read
> past pktslots[]. An exp_idx above max_idx makes
> brcmf_rxreorder_get_skb_list() read past the array or loop forever.
>
> Store the allocated maximum in the flow. Bound max_idx by it and the
> other indices by max_idx. Deliver a frame that fails the check without
> reordering.
>
> This was found with a static analysis tool that we develop. A userspace
> harness that compiles the fwsignal.c functions unchanged runs under
> AddressSanitizer. It shows the out-of-bounds accesses and the endless
> loop before this patch, but not after it. No hardware was available for
> testing.
>
> Fixes: 87edd8916ee2 ("brcmfmac: add AMPDU reordering functionality")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/core.h        |  2 ++
>  .../broadcom/brcm80211/brcmfmac/fwsignal.c    | 24 ++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
