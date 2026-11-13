Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590693;
	b=X7FB/vUVfjoQGaYhx7Et1/V6BO6P4tipD0Nmy8YsH4erIF+QDhMgtO6x9og9HMnXDQSe
	 9xr5vshZU+2jTDfruvTPU8P/I8WhfsJ1LItNPGRFZsxYUKhCkfAOIjWIAFm88nXyfOAzX
	 pxhVIcHrzhQFmDqxPcN41W//7CmqGarUUvf3eK2oMCl6wr/k1oQAFhTk0rDiIbeRhguqi
	 IfWrJbPxqrjjKFKQzlgNcs4j74pjDe4XiSEwuoJ07jzl5q+doVZQJbcpVA0ATSTMMytyX
	 YeV6U5HVQ4PlypKYSfE61xBJFyeZ4Zj6Ms2s1IU8Py4eY919ULMeOFnqn8fUJPcjvVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jhvgUdLmcuXsITWjIdcJRYEzmc5gsWkSLbwzyqjpaKQ=;
	b=cDCy/tu2UnDSEI0hqH5hzX7Hs8RvYi3tSQbhUVbwOphMoP3k80RV3MwolFtlwzopPy0V
	 cBTbC/upj99qz7BBoVSeMoEezqtuY7vW932HeJzff5/vPcFVPSTPJeHmrRkk4BYKXofdT
	 DjETfXbU1g4kM25p6ObFoYSNIE/7lcl2niqN7wXWAsRdNbVTngqtU9NAhTZsWSCaR7PO4
	 uRag+ZUMCr3d4tLbiiAPbgagxybrmxeHZiGPGKvlNdDBsewblC4HlD+xVTQHgsE8qLYeC
	 uWLt6FQTN3sJRm2iNOpO79geOHtVhDSxRLukEoPv/HPW/azPdmAxl1NnDHDX6XapQWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQrCFJdR;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18F1606CEEC
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 17:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F18F1606CEEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQrCFJdR
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6995445e9.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 09:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590691; x=1795195491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhvgUdLmcuXsITWjIdcJRYEzmc5gsWkSLbwzyqjpaKQ=;
        b=zQrCFJdRfXWgk8OEv5Ax3gtXyhelKidixwQgbs8Z3wgrmQNKJSG+hQy2EIG3PC1slW
         SrwyIM8jI3IameNVYvgy1hgj2zI3ur82hmv+IXAvvJLT+Jguu/LYIhr9Fv7g69bAVdMJ
         a2NJe9dmxTq5+yjfvafzpE9YQOM4eyLvCPubAQWf6DOyswLnP5LniCdC4oYk/WGOhj0p
         UrNRv7NydQp8ZkqAO7S471XxfADkqUPAqE+B2l+U1xZ1odWIlTvYMyF4mLfG/1YQV1ne
         PGKuwYZJuOAhAqC3OsG/zbOwkMB7z771uGSpaxQgmHGWKfUjMva4erzXyrd1K/WazGzh
         e2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590691; x=1795195491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhvgUdLmcuXsITWjIdcJRYEzmc5gsWkSLbwzyqjpaKQ=;
        b=fv1Kb3cK0VInNjfNZhH8x7lBk699AeT7UYMTfv5w0yR9SSLoUd5WH3f+/ZnRFW4zLx
         ptoaBKdrvryoA9XUUPvBhEyNrstTKCWWhDrro9oLs3CU++Shhym5rhQ8PhcV+/DzwFXn
         fDvIVA8EA9FgxsI9O45qBrKMJWBa+B9GXqfhaYzvMCMhR8jnK+0/nNx5c22H6GV+bcoD
         HANwsCk2FL0CXrg2CIGCP0/+aszL/XMLX4zHuCX5Kbs4r1mSSShBph7bh0JUWUc8zFfn
         h/XrVZmi9gfyAmt13VHGT0x0rL8PA1i2mmypt5f333ARGnXIC40yGCiQR0y96W+WsK2S
         jGcQ==
X-Forwarded-Encrypted: i=1; AL+hErHedYtx+5PUgf3KYYAJjhaq+Yqe+ve7aRHh9xKOrEROuZkG9YiRF7t82JLeGRcu4DODsrDfDPlVMP0z/1vVLw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UWNBHSln3Y57Ze/Nj+WpMMSvz/r/4g4Y0vyc9Si7HZ+q8/RTg
	6sKdDA3LyzBWr2VfZdKQ7dojG3fz3xmvLxVCsl3py5GyyNJMx4hFHLVT3Z6OTIc+
X-Gm-Gg: AYBFou1IevTghrNn3nMkMlVMtOOYhHA9TdJyvc8Hgx5sIOfmHX8mFxYZ3gwybv6T0fB
	Rq22YL6OFLGM0/6P9rkG7cAZIYWP0Y1HoEZDgYKLaxoIHmf7U8MAy1Tlft778ZP98BU3aeMTtro
	su0oxmkheYQ3LGoZW5m5ATfO+lM4fXJvSpAjRh0VEopzQCw6ykikEPr85kPvsU4uNWm+DtXGHex
	px9wPzpkebRSFK8uGFs5GaeQD6MgURdxHmkUu/JM5GM2Lz7KMuxyQpo9rIuQSWFD7FWpAMq7SJE
	mZ7DrJu4B8E4sCl4p2WYJMeGo46prfUFUfUkwpuxjNWQl4hK13XxRioNdtk7mA2Jmo0pzfc03nx
	avbY1Q8Wa2t6urxOnK/opm6gt477KQuQxY3WX7p4+fcAOfh4+6ugvy5L6GhevWgkZ3ORGMRk2t8
	Ny0YdFxI5BchROv2ej6uIOrtwDJUQ59Ei8/herIFDe/rYyLM7lvFxaDEktD0V2ufk0p+ANcrMce
	EsLd9YzX0W8XPHXfdAuzGuZ/7Ty9pFsKrh3A/8tUz4BBh4yhWXzppqJ2j28gc44zmc4k53UBUTC
	6j+TO6dqHeL0JbDOHBgQ7cyLoAVEKyKFtOw=
X-Received: by 2002:a05:600c:6208:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb55a66467mr63599825e9.25.1794590691155;
        Fri, 13 Nov 2026 09:24:51 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6033301f8f.21.2026.11.13.09.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:24:50 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next 1/3] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Fri, 13 Nov 2026 18:24:49 +0100
Message-ID: <20261113172449.3313425-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5FA04DA4-863E-46D3-A993-5F3C074ABC37@linux.dev>
References: 
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

On Fri, 13 Nov 2026, Luka Gejak wrote:
> Maybe rtw_fw_update_beacon_work() could skip the download while
> RTW_FLAG_RESTARTING is set? The reconfig downloads the beacon again for
> BSS_CHANGED_BEACON anyway.

On Fri, 13 Nov 2026, Zong-Zhe Yang wrote:
> How about adding a flag to indicate if this rtwvif has been init-ed or not ?
> If init-ed and rtw_ops_add_interface() again, call rtw_remove_rsvd_page() first.

Thank you both. I could reproduce it: with a test build that queues the
work right after rtw_enter_ips() in the recovery, v1 gives the "Should
not have an empty reserved page" warning on an RTL8822CE with an AP
interface.

I will take the RTW_FLAG_RESTARTING check for v2, as the flag already
covers the time from the reset to the end of the reconfiguration. With
it the same test build does not warn.

Best regards,
Mehmet
