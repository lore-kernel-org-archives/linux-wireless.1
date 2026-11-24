Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551252;
	b=aGWKA7NJiztQRx1nuolIwms4mRIyYMXFKA5j7TRtkiOO68e6MLf1wPVk813X7UO1nptx
	 6LS44Dv55kZuxPYCzMhszB9kOzbUxFhGCCb7uUN+cKW3hrHOWBnDuuq4n61lVOk4eb64t
	 VJK+NGQNew/4N4m91+FJU79KAodXPQeD4Aa1odC4TvwOt+Nq3Pz+W11Tqxxj7tIT+c+as
	 tdMQc/ksUp0j9NX4Yv6fTg6+4+dK3UIilK+rkKc4rDQ0Rzv5fqoMUgsEEYFmoDNbSScRQ
	 9klW7pKMBES1gc9ksgWzeJ7UL7oP8lnmdkwlRd7/z6oRomt83+eGWofGvWXHKjcRkLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551252;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=9Fpa+qTmEVAMmPdogRCF2tnqKlnfE7k0kPiEaWQldoI=;
	b=IquwD7gY3lyUozx4vEvd1uqmKF7ja6Zg4SZym2xjPpqrNboRa3LuE1SPEjriklG7weR3
	 os/kkxqLqRCedY+ZRW+h5FnkEgxdsduO8ecPt1QOKBsWm0ThBPwEta2Tn+0/TWdQCbkuM
	 LbMvTj0SI8cQA9iioH88hGgWaA6bZab29YB8B/nrniNOMN8KXIDa41mbL9BfaQHFeiWz8
	 YflVXDbNVpduvLg8unaz5sRK5o/vZmMskWCbpRylabpEEXc/2QLgTDK+XumN+H17SzSDR
	 oMLXmbiZtM4E/rBMvy+6pP55ICWSK8noY+vphCcSM5qkFFUMtOZbgJMEGHDUSkjwXSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M+HgFmJG;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470EA60A2627
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470EA60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M+HgFmJG
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-949664ee41cso505590785a.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551251; x=1796156051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Fpa+qTmEVAMmPdogRCF2tnqKlnfE7k0kPiEaWQldoI=;
        b=kHd2K/mVgvOV6ZPAYPizasa7nQOmlOsh2QlUT6tfo+zu+lftDrAeH99tYIK6wZ+whA
         fLyyDyR442PTMauCryI5AiBVhWU2YRPkXjgMsy2RJweqEJKxA5augQkwqpOp6lQhfXgc
         GdV/rw/I2pISS6JNyJtWGQvKihYTanFB4kQ1W92NMOpPL6A8EdyZ+WkzUsQ3StV4YkL+
         4zmRS3IFq7Cfo40i5NHn6pCSamkTAmh5UF9Wg10pyp9fV2chx4I+cZV3n70pGhY37Fsi
         dpKBEgQav2oXnuNfuF9a02qlaxKv8NlMhL0P3sQEhpdpi38Jokj7zjmDN6udMykJfFxD
         GBWg==
X-Gm-Message-State: APuU4Z9yCX3v28wZGB2jytLRQUpWaOWoh1GQWxlF15bHfw7eDQJE4YiP
	pwgF0snbU4+g/16AUH/k2LcJrw4XvHksWmwQv8NKj/qSWOvZHTJsv3o+BTMg/jgvMURc+dbC4bu
	unmsMX1AT0r5WZPB3zZc+2wwdzdm36LIYawpeIcbn3YxY0SAPyq+bnG1m1GvRpnohw9OGq5BEy5
	3PO6oaXCslMd3zELPm5VcBhne7rSeqfqRPDcLz8tSgBBcOWjDaxzC90feXbiSpdK4Nrt7vyU/mQ
	5ldVRX3buhbunp0GHmPzHaZUS/o
X-Gm-Gg: AZFdTZcPTvLLiuvT4+5FzxHjBKarorte48Iu0j8Ifwnwqz1F4zUW+hMf02XNvl5LHTO
	3eG8Pl0ThnVDWR6PxQVidlUmHiy5fzcrmSi3Zu8xs+e4RLyn6UGw3K+0qwu68s6y36n639krccK
	ghMmaWGftZ6e5Y4kx8LfNObmjTMODHYWyuECa6JM7SJXBGPWwA6NYoFaApHT+0SlFuaOHuXGwTj
	U18eybzFBboxA+ukOyzK0Ma6i+3rbrRwPC2DY4SLXVyif9llHsExeSkpBBMC2yLTaMgJq8F64Cm
	jEFCEX3BlvaEPMFq2S0j/GQKv3mDgPFnRrOzqHs+Hb8pEkIf5AtJhax24fbJwelDkIJMaMs7caw
	cmqrzBeDLzq7wX9dzq5L5UQfsluVXlzWiWNwlgSO3kdMkSgYVFeu/p8xEno0sujlOm+FreZEEDD
	JlrMpRJyrXKr4zmhRT+mSj7B/xSXUpe14p3c4wBUk=
X-Received: by 2002:a05:620a:838a:b0:93f:3120:6c6d with SMTP id af79cd13be357-949ba9fe6fbmr2632494785a.35.1795551251095;
        Tue, 24 Nov 2026 12:14:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb34ee75sm111543985a.8.2026.11.24.12.14.10
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92135a58c91so3956016d6.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551249; x=1796156049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Fpa+qTmEVAMmPdogRCF2tnqKlnfE7k0kPiEaWQldoI=;
        b=M+HgFmJGC/pcK03QgAhKT94to+ZwQ5V/8uPVAKH6exU4zryz+YDSnXAJeUSB3H43Sn
         zAXvdzQWr8KtXTs6auscimiuMfJPbkI0Lh5vTYLXhaAUgyASOykzE88FfUhYRWbLP0S3
         rcNMoQjkiWGW6jc7/9vgzzqit/OBrkNIrM4yY=
X-Received: by 2002:a05:6214:d61:b0:915:3066:2035 with SMTP id 6a1803df08f44-9213498a6c2mr285388446d6.7.1795551249596;
        Tue, 24 Nov 2026 12:14:09 -0800 (PST)
X-Received: by 2002:a05:6214:d61:b0:915:3066:2035 with SMTP id 6a1803df08f44-9213498a6c2mr285387846d6.7.1795551249068;
        Tue, 24 Nov 2026 12:14:09 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:08 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 3/7] wifi: brcmsmac: embed macstat_snapshot in brcms_core
Date: Tue, 24 Nov 2026 21:13:58 +0100
Message-ID: <20261124201402.3499613-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-4-rosenp@gmail.com>
References: <20261111042554.232998-4-rosenp@gmail.com>
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

On Tue, 10 Nov 2026 20:25:50 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The MAC statistics snapshot is a fixed-size struct with the same
> lifetime as struct brcms_core. Embed it directly instead of allocating
> it separately, removing one kzalloc()/kfree() pair and its OOM error
> path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmsmac/debug.c    |  2 +-
>  .../net/wireless/broadcom/brcm80211/brcmsmac/main.c | 13 ++-----------
>  .../net/wireless/broadcom/brcm80211/brcmsmac/main.h |  2 +-
>  3 files changed, 4 insertions(+), 13 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
