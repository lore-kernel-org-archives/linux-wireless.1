Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392426;
	b=TOzNHj5FR0bf2l9xVa6LCtt94oS8mVEXNaV+Xi3wJdSclBsrc661DTYWVRCOlSOvPnhC
	 C3PSSQJLtWQtKOkW51T2kcDZPgiw6p45HbotG92ICPyz/y8ovpCYLbpS5fHwuCyaQJK5y
	 eQXuBUnQDl9AWjF710teptSQTgD5nff79fjDD4d22b8WoLpnESrtpzUSyc29nHdmCmeWY
	 aMVgsqjLX8YlQFVXgkfbegDoD1Il2hXHvc0QHQQeJhl+cRxoBm38UNwP68PbhTEu3nubB
	 xoWUWz+9VfBIQJN03L/5xe++lzW53MT+g36uYUe9qXRCTZZWXNk61soD7jnaNVQ8HDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:MIME-Version:X-Received:Reply-To:Message-ID:Date:
	 Subject:From:To:Content-Type;
	bh=QeoVR9Q/9Qn9Y7FBG3pI9ikboP7+TU4ZcNrcLlo6h80=;
	b=Wy86uv060xoonU2IX1ophPorjTKt0vpkbVM1LkOdZ81CyaLwoTc0udRDH/aLKVzNkSM6
	 t64l3y7OzKFhJBlLNpwewA3r+TPrsb6bHsZYDqoDUC0Fg5WEF7q4mxDT29cmIOMUgTSvF
	 RM3uj6R97uXmPZoKQo7RKdwA4ebVZiXqpR+muItqVp6Hm2IfVrDsUndoKHae735wzUp7t
	 HYmIJSdHWUkxmzfkcdqYbNoZZ7HLz6XFNhWXVPK3+bDSWSkZbOjqtGV5tOdVxImhBmAel
	 hlevUETkhb5gEblcR+VEIhpw3E1lWbPkTfmUF4KLdu7APPsJ237KazQVTNsetfYrLGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QNNi9pDH;
	arc=none smtp.remote-ip=74.125.224.70
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDB3606A331
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 10:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDB3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QNNi9pDH
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67bee42cc71so6667536d50.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 02:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392425; x=1794997225; darn=vger.kernel.org;
        h=content-type:to:from:subject:date:message-id:reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QeoVR9Q/9Qn9Y7FBG3pI9ikboP7+TU4ZcNrcLlo6h80=;
        b=QNNi9pDHprDlhm+RQVYjJcdUdh0232RXcYjlH9UvYqdSeYYG4G+5f35zqRNbz96C9v
         A09s/iGxUWctL31ImmZCxcrN7B7txNjjGRnAc5vh/hbCovbwX+aHYhRkxXbSPxvAMSEU
         /bQoXUlNMQHqjI+5uH5LHLdWX9DXyN29NwXrh/bDjm3hiK9sdXQS5+kkQ4OaPRU+pRN9
         R2NJigGvghcrOypmsekLhky/S0/FJCQJRnJ40n3Nr3Ro3PWf0MogWkw0VahrwKueae5E
         h+elTirbooxT7oJksky4C9wbbRb+q19wTS5q63OLCKUARt6G/DzltNH5WM8rIJ55sBnI
         gpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392425; x=1794997225;
        h=content-type:to:from:subject:date:message-id:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeoVR9Q/9Qn9Y7FBG3pI9ikboP7+TU4ZcNrcLlo6h80=;
        b=hN2INBwxwGi17mJpbVBLiszgCpWmXGXFHkfSHHd3rhGWYGBm19g3Gm9MaAVTC+81X7
         wELewTAg0PZsPcOay/x9+l9NYnTX5y9xWygVplD4zFBCJ8mQoulRNyyxDFh899YABQmU
         /cdMVVhFYS5gpKsZi5PHmgRY4OfsRebXgFHRkixKmhtJnPYwni3a55xK5vxLJ6KiF8z8
         79fZwQHMusR6FIq1SVFSmaB9TVErbpzanSsXbCK+hIouHwkTJDMIhlQdSo7Q7wdUulKm
         Xw7kH926dfR+H5v+RT9bo83XA1XNXOBQ6zwrYDvqYDCBmI95/a7H3AMu1cfBoCp3PtYf
         4Efw==
X-Gm-Message-State: APuU4Z/aPj9AANP8tVzmCOZTkLekIAKr2seLdjn/knpcUQeySo16A+R6
	HXv/Bngrs4hqxTKHo27DjIDqZEiKYNHoC1AlGK9rrsnfVLdEMFbzFTndjY3Bb2CHUT8L17zzvto
	jZxo=
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:690e:488f:10b0:677:b426:5087 with SMTP id
 956f58d0204a3-67c67cc1291mr1114541d50.8.1794392425157; Wed, 11 Nov 2026
 02:20:25 -0800 (PST)
Reply-To: editorfiddlehead@gmail.com
Message-ID: <autogen-java-c600b627-afed-4693-b2ac-4226ad87ad91@google.com>
Date: Wed, 11 Nov 2026 10:20:25 +0000
Subject: A journal for your work
From: naveen.gutti152@gmail.com
To: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Hello Linux Wireless,
I thought Fiddlehead might be worth considering for your research work.
Details at https://fiddlehead.info/
Best,
Editorial Office
