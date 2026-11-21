Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290596;
	b=MoKINYfBgF0lvOsbh4sUPSi5DiJ61nZjsQ53Y6WGSmgEORjJie2Qu/THcO99SO7keZ2W
	 4DNtu1BMy+aPusugvw3HS7HDpAAw3VlAnGwL7puGIHm789EInwZ11MBbeM4MdBQci1cSC
	 KtXpsArEuPNheX7XHiTBKDUAozNUsUNa8fpxShzpPHZ1ExGNnMUms0XA82I5iCeQUJcCp
	 zRiN5FWWp081BwfdW8d7mw+zvNClXMqHztOALHshtz7xSYAjg0ftkNfBkZhsah73qmU/t
	 4Ctc9obvSi3KPwG6Mm9292anhKuk34bRaXm4QnkvZd8KHYlzKyr2PcvdFi78sbIMdtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vEYZIcEN6miNF4ppvgk3ec21E8vDAW2BxTkHvXErz94=;
	b=sl8dMl5toAaefE8ajIkvn7DylCsEv9VFZQhL/7XrnDncGKg3Guk4e06eS7PDr6pbX3Dy
	 QgYPifquFEDQdtsILz3F7eXH+lBHlam2GGzlT73FkVZsoF8B9wB9PejZwoZZLuUZxVNXV
	 zTp29F5hx+vUR3zZCVnWZh9sNf3/aMBz28Mx1/oMkskiPaOBjYnaIEXHCFsvbi0UDULe/
	 sLP6oHNihQRREIB3/7dtXK+KLa3SpwG5zW6sl5EVQu6JN5y6SmKxh81H+/3XcKhiIl/oJ
	 6xeUlCba2+vk6eYEahQdGtYXfywboX2EX1mKtkP4x9jJSnuLa43BObswRIdXIPgYNhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOd3a2s1;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52997606A32A
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52997606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOd3a2s1
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso14129935e9.1
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290595; x=1795895395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEYZIcEN6miNF4ppvgk3ec21E8vDAW2BxTkHvXErz94=;
        b=iOd3a2s1ZmQSjw+L0eJ8WMEhtEeC40eT/cM3QIKCkqIaGGJKnP1dvzgGSK1YJ9UIZF
         IaK2FAZ5ilyEtX+2mL8vbW+wsM+y7pwdDZ1wmmdTpEFtTRtn73mdCsGq+Y9ZEjrec687
         VbVxsOoexRUHCZyZXbI3laqH7k5ImBal8GxCQHLSSvfp57L9+MFtMVvX3PIpbe6CwXmR
         n+VLhZ9IhGvO/SaI65UgVn3BAqWLA7brCPZ/m2EQfB3dgnqh07B3O9q6gUIb06HrQLXZ
         b8EcphdJaxrnXF7oIn+iVKYyFY+6N4BkU15DJEglsk6rs0zXd2ZOxlO88Omr0iIPNAXn
         aT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290595; x=1795895395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEYZIcEN6miNF4ppvgk3ec21E8vDAW2BxTkHvXErz94=;
        b=TAPczcjEtK1RPZX79Z5tkhhiykUSAwj6yHaTmt288uOM1U+Rzlnv0U3plLTTiArQJM
         A5JxlnXVkV/uPpHeqSJbRUnYmQo1YMp3bJLG5uZBGtHwCn1ZHwUueb2w1XifIzuOMZPI
         kV0OCdtS5clwab1GSzPp8OcNw/99xIeduUHULSNzo1SiNF4AJhO7mjIi7YFMTiB106BJ
         xXfhOu/U6cEQY9LI7PDxzMaf4JBr4qehOXygUbaAtJKP7l0jFwYubF22fWSDE0Gq1U0U
         MKFyNOmjOUzl2P6h1Ajkg77GmirsXsimcnUgDZjJ4RXsfeTwHe/wYUHues7P3fNlcTnX
         JFdQ==
X-Forwarded-Encrypted: i=1; AL+hErHnpNUIu9YaOmF0BAbURKcXc5eGgCJfz/JuJFgV+qUlVnWnNJ/xoxVOLSBEZixNVV7h5qtXcsDU3e6UYye2XA==@vger.kernel.org
X-Gm-Message-State: APuU4Z82Bc7peN4pKX6kVFFxOGWgQVUjmM2JXkrV88/8oFVZv+1m85aO
	f1wMfK43OQQBqfUnFtsmVjibowc0zvZevXYbiHhQ3Y2rUdVVNzvtgAWB
X-Gm-Gg: AZFdTZdkYlk0Gc2qPjYljwZ8PKsDvrOD1OM2j1k5oKOj6FlbciGaBRYlqCm9HxvxsY0
	jLkzeuYyfdDh8VYR6seAW1jGn4QqAIvO47jaihxUUpJfs1rwvFjxcpe3ktj9Ct36INbLSk8kAIW
	EAAYqewTC3S88Yb3aSiDUfDKuII7bEJ2vmi93ARPwpP4bGLYpm56DELv6sK6zz1AlSuura+WKsR
	PQ0b+mCOj+4chZIc8/OB9dZbO9nRR1DV4fx/xrKH35bFPUNIvPDwsZEfiol1PFm8p1vzyTSn+0O
	PYhNbaJGYXXtOaZhGP6ehthYBM3IM0Qj753iGGVn7nv5zVbSUB9QKTKy9XILjZZ5hAlADSN33cg
	7n3bLC49HYcptnhTFV5n2kbU8yrVmbjk8kT8lzbM7/a5P0w3T9m5oJmQmtFkZOdsTGcl20C0KpT
	ZxXEJWFXmg4ul/EcHugSg7ZPkLodoQ6r4u4VCMjMKc3edQ6kYRi8f0qw2a6RueLV+Qejjsmk1s0
	PtY2WXiZjUbb7944lDkfufuzvNepQdS0RQ209lsrRhhGD0KAsU4R3ed1aSqOk/AAGMOuQPwNjk4
	WZWruYF2U107XAyQbjS0pASIN3eV6SVy8iJt7Q==
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr146998045e9.16.1795290594502;
        Sat, 21 Nov 2026 11:49:54 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:49:54 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 0/3] wifi: ath10k: firmware feature bits for WCN3990 on SDM660
Date: Sat, 21 Nov 2026 20:49:36 +0100
Message-ID: <20261121194939.3647400-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The WCN3990 firmware shipped for SDM660 devices crashes on two WMI
requests that ath10k sends by default (scan channel stats events and
pdev quiet mode), and finds no 5 GHz BSS when 5 GHz channels are
scanned actively.

Rather than adding chip checks, add three firmware feature bits so the
affected firmware images opt in through firmware-N.bin. Nothing changes
for firmware that does not set them. The ath10k-fwencoder change in
qca-swiss-army-knife to set the new names will be sent separately.

Tested on SDM660 (WCN3990).

Gianluca Boiano (3):
  wifi: ath10k: add firmware feature bit to skip channel stats events
  wifi: ath10k: add firmware feature bit to skip quiet mode
  wifi: ath10k: add firmware feature bit to force passive scan on 5 GHz

 drivers/net/wireless/ath/ath10k/core.c    |  3 +++
 drivers/net/wireless/ath/ath10k/core.h    | 13 +++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c     |  5 +++++
 drivers/net/wireless/ath/ath10k/thermal.c |  5 +++++
 drivers/net/wireless/ath/ath10k/wmi.c     |  4 +++-
 5 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.56.1

